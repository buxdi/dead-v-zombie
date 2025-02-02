/**
 * StanceModifier (Javascript Edition)
 * Author: ItsAmmarB (Discord: ItsAmmarB#7897)
 * Release: 2.0.0
 *
 * Credits to:
 * JediJosh920 (https://www.gta5-mods.com/users/jedijosh920) (https://www.youtube.com/channel/UCmvRF-KB6xCwjHnNgMeUDXw)
 * TimothyDexter  (https://forum.cfx.re/u/timothy_dexter)
 *
 * open issue card on github or on the cfx post if you have any issues/bugs/improvements.
 *
 * Issues:
 *   - Snipers force 3rd person view due to (SCRIPTED_GUN_TASK_PLANE_WING).
 *   - Ped will be seen standing up while aiming whilst prone state, (SCRIPTED_GUN_TASK_PLANE_WING) Animation is not synced with other clients. (Fourthbeam)[https://forum.cfx.re/u/fourthbeam/summary]
 *
 *  Useful sources:
 *   - https://github.com/GTA-Network/GTAVTools/blob/master/GTAVHook/GTAV.h
 *
 *
 *  Commits:
 *   - 1/30/2020 | 1.0.0 | Initial release, credits to TimothyDexter (https://forum.cfx.re/t/release-stance-modifier-crouch-and-prone/172038)
 *   - 2/1/2020 | 1.0.1 | Patch for ProneFlip, now works.
 *   - 2/2/2020 | 1.0.2 | Removed Server.js and the console message
 *   - 3/8/2022 | 2.0.0 | Complete overhual and re-write, many issues and bugs were fixed
 *   - 5/3/2022 | 2.0.2 | Prone in car fix, made it more user-friendly.
 */


// ========================================================================================================================
//                                                     CHANGABLE VARIABLES
// ------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING
// ========================================================================================================================


/**
 * There will effect every player, choose them wisely
 * refer to https://docs.fivem.net/docs/game-references/controls/
 * if you want to change the default keybinds
 */
const Config = {
    FPV: true, // First Person View,
    FireInProne: true,

    Controls: {
        Forward: 32, // Move Forward (W)
        Backward: 33, // Move Backward (S)
        Right: 34, // Move Right (D)
        Left: 35, // Move Left (A)
        Aim: 25 // Aim (RIGHT MOUSE)
    }
};
/**
 * NOTES:
 * - The First person view is very laggy and unplayable, I highly recommned keeping it disabled, crashes may occure on low-end PC if enabled!!
 * - Using weapon whilst in prone stance will result in de-sync, others will see you standing up and they won't be able to inflict damage to you
 */

// ========================================================================================================================
//                                                    KEY MAPPINGS/KEYBINDS
// ------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING
// ========================================================================================================================

/**
 * Refer to this page https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
 * if you are thinking of adjusting any of the below default key mappings/keybinds
 */

RegisterKeyMapping('AdvanceStance', 'Advance Stance', 'keyboard', 'LCONTROL');
RegisterKeyMapping('ProneFlip', 'Prone flip', 'keyboard', 'LSHIFT');

RegisterKeyMapping('Idle', 'To Idle Stance', 'keyboard', '');
RegisterKeyMapping('Stealth', 'To Stealth Stance', 'keyboard', '');
RegisterKeyMapping('Crouch', 'To Crouch Stance', 'keyboard', 'Z');
RegisterKeyMapping('Prone', 'To Prone Stance', 'keyboard', 'X');

/**
 * Using '=' as the first character decreases the possiblity of the command just randomly showing
 */
RegisterCommand('AdvanceStance', () => {
    if (CheckInterference(PlayerPedId())) return;
    AdvanceStance(PlayerPedId());
});
RegisterCommand('ProneFlip', () => {
    if (CheckInterference(PlayerPedId()) || Cached.Prone._isDiveInProgree) return;
    ProneFlip(PlayerPedId());
});

RegisterCommand('Idle', () => { Idle(PlayerPedId()); });
RegisterCommand('Stealth', () => {
    if (CheckInterference(PlayerPedId()) || Cached.Prone._isDiveInProgree) return;
    AdvanceStance(PlayerPedId(), Stances.Stealth);
});
RegisterCommand('Crouch', () => {
    if (CheckInterference(PlayerPedId()) || Cached.Prone._isDiveInProgree) return;
    AdvanceStance(PlayerPedId(), Stances.Crouch);
});
RegisterCommand('Prone', () => {
    if (CheckInterference(PlayerPedId()) || Cached.Prone._isDiveInProgree) return;
    Prone(PlayerPedId());
});

// ========================================================================================================================
//                                                          VARIABLES
// ------------------------------------------------------------------------------------------------------------------------
//                            DO NOT TOUCH THE BELOW VARIABLES AS THEY ARE ESSENTIAL AND PRECISE
// ========================================================================================================================

const Timers = {
    Delay: 1000,
    ProneToIdleInvincibility: 250,
    ProneTransition: 1050,
    ForwardCrawl: 850,
    BackwardCrawl: 1200,

    DelayToAdvanceStance: 10,
    DelayToProne: 200,
    DelayToDive: 350,
    DelayToFlip: 1000,
    DelayToNextFlip: 250
};

const Stances = {
    Idle: 0,
    Stealth: 1,
    Crouch: 2,
    Prone: {
        Stomach: 3,
        Back: 4
    }
};

const Movements = {
    Forward: 0,
    Backward: 1,
    Left: 2,
    Right: 3
};

const Cached = {
    Prone: {
        _state: null,
        _lastKeyPressAt: null,
        _debounceTime: null,
        _lastLeftRightPressAt: null,
        _lastBodyFlipAt: null,
        _isDiveInProgree: null,
        _isCrawlInProgress: null,
        _previousState: null,
        _previousWeapon: null,
        _aimActive: null,
        _allowFlip: null,
        _lastProneAt: null
    },
    ped: null,
    stance: Stances.Idle
};

RequestAnimDict('move_crawl');
RequestAnimDict('move_jump');
RequestAnimSet('move_ped_crouched');

// ========================================================================================================================
//                                                           MAIN THREAD
// ------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING
// ========================================================================================================================

/**
 * Runs every tick... obviously, cause preformance is overrated
 */
setInterval(() => {
    const Ped = PlayerPedId(); // The player's ped that will be used in every tick, this is the only GetPlayerPed native in this script
    Cached.ped = Ped;

    /**
     * This is basically the manager
     * the [Cached.stance] is the current stance setting
     * once [Cached.stance] is overwritten this switch will execute all needed functions for that stance to work
     */
    switch (Cached.stance) {
    case Stances.Idle:
    {
        SetPedStealthMovement(Ped, false, 'DEFAULT_ACTION');
        ResetPedWeaponMovementClipset(Ped);
        SetWeaponAnimationOverride(Ped, 'Default');

        break;
    }
    case Stances.Stealth:
    {
        SetPedStealthMovement(Ped, true, 'DEFAULT_ACTION');
        ResetPedWeaponMovementClipset(Ped);
        SetWeaponAnimationOverride(Ped, 'Default');

        break;
    }
    case Stances.Crouch:
    {
        SetPedStealthMovement(Ped, false, 'DEFAULT_ACTION');
        SetPedUsingActionMode(Ped, false, -1, 'DEFAULT_ACTION');
        SetPedMovementClipset(Ped, 'move_ped_crouched', 0.55);
        SetPedStrafeClipset(Ped, 'move_ped_crouched_strafing');
        SetWeaponAnimationOverride(Ped, 'Ballistic');

        if (!Config.EnabledFPV && GetFollowPedCamViewMode() === 4) {
            SetFollowPedCamViewMode(0);
        }

        if (IsPedRagdoll(Ped) && IsPedInMeleeCombat(Ped)) {
            ClearPedTasks(Ped);
            ResetPedMovementClipset(Ped, 1);
            ResetPedStrafeClipset(Ped);

            Cached.stance = Stances.Idle;
            break;
        }
        break;
    }
    case Stances.Prone.Stomach:
    case Stances.Prone.Back:
    {
        SetPedStealthMovement(Ped, false, 'DEFAULT_ACTION');

        ResetPedMovementClipset(Ped, 1);
        ResetPedStrafeClipset(Ped);

        if (!Config.FireInProne) DisableControlAction(0, Config.Controls.Aim, true);

        if (Cached.Prone._isDiveInProgree) break;

        if (IsPedInMeleeCombat(Ped) || IsPedRagdoll(Ped)) {
            IsPedInMeleeCombat(Ped) ? SetPedToRagdoll(Ped, 1, 1, 0) : undefined;
            ClearPedTasks(Ped);

            Cached.stance = Stances.Idle;
            break;
        }
        HandleProneWeaponChange(Ped);
        handleProneAim(Ped);
        HandleProneMovement(Ped);
        break;
    }
    }


    /**
     * Those are action that could interfer with stance animation or prevent it from working probably
     * if any of those occure the ped will be set to the idle stance
     */
    if (CheckInterference(Ped)) {
        if (Cached.stance === Stances.Prone.Stomach || Cached.stance === Stances.Prone.Back) {
            ResetProneAnimation(Ped);
        } else {
            Idle(Ped);
        }
    }
}, 15);

/**
 * @name AdvanceStance
 * @description Advances to the next available stance, stance order: Idle -> Stealth -> Crouch ---> (repeat)
 * @param {*} Ped The players' ped
 * @param {*} AdvanceTo The specific stance to advance to if available (Optional)
 * @returns returnless
 * @example AdvanceStance(Ped)
 */
const AdvanceStance = (Ped, AdvanceTo = undefined) => {

    if (AdvanceTo) {
        Cached.stance === Stances.Prone.Stomach || Cached.stance === Stances.Prone.Back ? ClearPedTasks(Ped) : undefined;
        switch (AdvanceTo) {
        case Stances.Idle: {
            if (Cached.stance === Stances.Crouch) {
                ResetPedMovementClipset(Ped, 1);
                ResetPedStrafeClipset(Ped);
            }

            SetPedCanPlayAmbientAnims(Ped, true);
            SetPedCanPlayAmbientBaseAnims(Ped, true);

            Cached.stance = Stances.Idle;
            return;
        }
        case Stances.Stealth: {
            if (Cached.stance === Stances.Crouch) {
                ResetPedMovementClipset(Ped, 1);
                ResetPedStrafeClipset(Ped);
            }

            SetPedCanPlayAmbientAnims(Ped, true);
            SetPedCanPlayAmbientBaseAnims(Ped, true);

            Cached.stance = Stances.Stealth;
            return;
        }
        case Stances.Crouch: {
            if (Cached.stance === Stances.Prone.Stomach || Cached.stance === Stances.Prone.Back) {
                ResetProneAnimation(Ped);
            }
            if (Cached.stance === Stances.Crouch) {
                return Idle(Ped);
            }
            SetPedCanPlayAmbientAnims(Ped, false);
            SetPedCanPlayAmbientBaseAnims(Ped, false);

            Cached.stance = Stances.Crouch;
            return;
        }
        }
    } else {
        switch (Cached.stance) {
        case Stances.Idle: {
            SetPedCanPlayAmbientAnims(Ped, true);
            SetPedCanPlayAmbientBaseAnims(Ped, true);

            Cached.stance = Stances.Stealth;
            return;
        }
        case Stances.Stealth: {
            SetPedCanPlayAmbientAnims(Ped, false);
            SetPedCanPlayAmbientBaseAnims(Ped, false);

            Cached.stance = Stances.Idle;
            return;
        }
        case Stances.Crouch: {
            SetPedCanPlayAmbientAnims(Ped, true);
            SetPedCanPlayAmbientBaseAnims(Ped, true);
            ResetPedMovementClipset(Ped, 1);
            ResetPedStrafeClipset(Ped);

            Cached.stance = Stances.Stealth;
            return;
        }
        }
    }
};

/**
 * @name ResetProneAnimation
 * @description Resets the players' ped animation, this is basically being called after in every stance except the prone stance in case the prone animation get bugged.. from experience :/
 * @param {*} Ped The players' ped
 * @returns returnless
 * @example ResetProneAnimation(Ped)
 */
const ResetProneAnimation = Ped => {
    if (IsEntityPlayingAnim(Ped, 'move_jump', 'dive_start_run', 3)) {
        StopAnimTask(Ped, 'move_jump', 'dive_start_run', 0.0);
    }

    const animationList = ['onfront_fwd', 'onfront_bwd', 'onback_fwd', 'onback_bwd'];
    for (const animation in animationList) {
        if (IsEntityPlayingAnim(Ped, 'move_crawl', animation, 3)) {
            StopAnimTask(Ped, 'move_crawl', animation, 0.0);
        }
    }
};

/**
 * @name CheckInterference
 * @description Checks the ped's current status and determine if there is an interference happening
 * @param {*} Ped The players' ped
 * @returns {boolean} True/False
 * @example CheckInterference(Ped)
 */
const CheckInterference = Ped => {
    if (IsPedCuffed(Ped) || IsPedUsingAnyScenario(Ped) || IsEntityPlayingAnim(Ped, 'mp_arresting', 'idle', 3) ||
        IsEntityPlayingAnim(Ped, 'random@mugging3', 'handsup_standing_base', 3) || IsEntityPlayingAnim(Ped, 'random@arrests@busted', 'idle_a', 3) ||
        IsPedInAnyVehicle(Ped, false) || IsEntityInWater(Ped) || IsPedSwimming(Ped) || IsPedSwimmingUnderWater(Ped) || GetVehiclePedIsTryingToEnter(Ped) !== 0 ||
        IsPedDeadOrDying(Ped) || !IsPedOnFoot(Ped)) {
        return true;
    } else {
        return false;
    }
};

/**
 * @name Idle
 * @description Sets the players' ped stance to Idle
 * @param {*} Ped The players' ped
 * @returns returnless
 * @example Idle(Ped)
 */
const Idle = (Ped) => {
    switch (Cached.stance) {
    case Stances.Crouch:
    {
        ResetPedMovementClipset(Ped, 1);
        ResetPedStrafeClipset(Ped);

        SetPedCanPlayAmbientAnims(Ped, true);
        SetPedCanPlayAmbientBaseAnims(Ped, true);
        Cached.stance = Stances.Idle;
        break;
    }
    case Stances.Stealth:
    {
        Cached.stance = Stances.Idle;
        break;
    }
    case Stances.Prone.Stomach:
    case Stances.Prone.Back:
    {
        ResetProneAnimation(Ped);
        SetEntityInvincible(Ped, true);// Going ragdoll while prone has a small chance of inflicting dmg to ped, this should prevent that, this is reverted in line No.
        SetPedToRagdoll(Ped, 1, 1, 2);
        setTimeout(() => SetEntityInvincible(Ped, false), Timers.ProneToIdleInvincibility);
        Cached.stance = Stances.Idle;
        break;
    }
    }
};

/**
 * @name Prone
 * @description Sets the players' ped stance to prone
 * @param {*} Ped The players' ped
 * @returns returnless
 * @example Prone(Ped)
 */
const Prone = (Ped) => {
    if (Cached.stance === Stances.Prone.Stomach || Cached.stance === Stances.Prone.Back) return Idle(Ped);

    Cached.Prone._previousState = Cached.stance;
    Cached.Prone._lastProneAt = GetGameTimer();
    Cached.Prone._previousWeapon = GetHashKey(GetCurrentPedWeapon(Ped, true));

    Cached.stance = Stances.Prone.Stomach;

    SetPedStealthMovement(Ped, false, 0);

    let _DiveInterferInterval;

    if (IsPedRunning(Ped) || IsPedSprinting(Ped)) {
        ClearPedTasks(Ped);
        Cached.Prone._isDiveInProgree = true;
        TaskPlayAnim(Ped, 'move_jump', 'dive_start_run', 8.0, -8.0, -1, 0, 0.0, 0, 0, 0);

        /**
         * This prevents force prone stance if the dive was canceled midway
         * which will lead to a bugged ped stuck in prone stnace unable to move or cancel
         * this interval is cleared later in line No.352 [clearInterval(_DiveInterferInterval)] to spare preformance
         */
        _DiveInterferInterval = setInterval(() => {
            if (Cached.stance === Stances.Prone.Stomach ||
                Cached.stance === Stances.Prone.Back) {
                if (IsPedRagdoll(Ped)) {
                    ClearPedTasksImmediately(Ped);
                    Idle(Ped);
                    Cached.stance = Stances.Idle;
                }
            }
        }, 5);

        setTimeout(() => {
            Cached.Prone._isDiveInProgree = false;
        }, Timers.ProneTransition);
    }

    setTimeout(() => {
        clearInterval(_DiveInterferInterval); // Clearing the interval in line No.336
        if (Cached.stance === Stances.Prone.Stomach || Cached.stance === Stances.Prone.Back) {
            if (IsPedRagdoll(Ped)) {
                return Cached.stance = Stances.Idle;
            } else if (IsPedArmed(Ped, 4)) {
                if (Config.FireInProne) {
                    return TaskAimGunScripted(Ped, GetHashKey('SCRIPTED_GUN_TASK_PLANE_WING'), true, true); // This is the same animation when Trevor was on the plane wing and shooting in Singleplayer
                } else {
                    emit('chat:addMessage', { args: Config.Messages.NoFireInProne });
                }
            }
            const [pX, pY, pZ] = GetEntityCoords(Ped);
            const [rX, rY, rZ] = GetEntityRotation(Ped, 0);
            const animStartTime = 1;
            const animFlags = 2; // ANIM_FLAG_STOP_LAST_FRAME
            TaskPlayAnimAdvanced(Ped, 'move_crawl', 'onfront_fwd', pX, pY, pZ, rX, rY, rZ, 8, -8, -1, animFlags, animStartTime, 2, 0);
        }
    }, Cached.Prone._isDiveInProgree ? Timers.ProneTransition : 0);
};

/**
 * @name ProneFlip
 * @description Flip players' ped whilst in prone stance to crawl on stomach or back
 * @param {*} Ped The players' ped
 * @returns returnless
 * @example ProneFlip(Ped)
 */
const ProneFlip = (Ped) => {
    if (Cached.Prone._isDiveInProgree) return;
    if (Cached.stance !== Stances.Prone.Stomach && Cached.stance !== Stances.Prone.Back) return;

    if (Cached.Prone._lastProneAt >= GetGameTimer() - Timers.DelayToFlip) return;
    if (Cached.Prone._lastBodyFlipAt >= GetGameTimer() - Timers.DelayToNextFlip) return;

    Cached.Prone._lastBodyFlipAt = GetGameTimer();

    //console.log(`Cached.stance: ${Cached.stance}`);
    //console.log(`Cached.Prone._previousState: ${Cached.Prone._previousState}`);
    if (Cached.stance !== Cached.Prone._previousState) {
        SetEntityHeading(Ped, GetEntityHeading(Ped) + 180); // Rotating 180 degrees
        Cached.Prone._previousState = Cached.stance;
    }

    Cached.stance = Cached.stance === Stances.Prone.Stomach ? Stances.Prone.Back : Stances.Prone.Stomach;
    UpdateProne(Ped);
};


/**
 * @name UpdateProne
 * @description Handles changes to the prone stnace like; weapon change, start/stop aiming, and flipping on stomach/back
 * @param {*} Ped The players' ped
 * @returns returnless
 * @example UpdateProne(Ped)
 */
const UpdateProne = (Ped) => {
    const animName = Cached.stance === Stances.Prone.Stomach ? 'onfront_fwd' : 'onback_fwd';
    const [pX, pY, pZ] = GetEntityCoords(Ped);
    const [rX, rY, rZ] = GetEntityRotation(Ped, 0);
    const animStartTime = 1;
    const animFlags = 2; // ANIM_FLAG_STOP_LAST_FRAME
    StopAnimTask(Ped, 'move_crawl', animName, 0.0);
    TaskPlayAnimAdvanced(Ped, 'move_crawl', animName, pX, pY, pZ, rX, rY, rZ, 8, -8, -1, animFlags, animStartTime, 2, 0);
};

/**
 * @name HandleProneWeaponChange
 * @description Handles weapons changes... self-explanatory
 * @param {*} Ped The players' ped
 * @returns returnless
 * @example HandleProneWeaponChange(Ped)
 */
const HandleProneWeaponChange = (Ped) => {
    const currentWeapon = GetHashKey(GetCurrentPedWeapon(Ped, true));
    if (Cached.Prone._previousWeapon !== currentWeapon) {
        Cached.Prone._previousWeapon = currentWeapon;
        UpdateProne(Ped);
    }
};

/**
 * @name HandleProneMovement
 * @description Handles the players' movements in the prone stnace
 * @param {*} Ped The players' ped
 * @returns returnless
 * @example HandleProneWeaponChange(Ped)
 */
const HandleProneMovement = (Ped) => {
    if (IsControlJustPressed(2, Config.Controls.Backward) || IsControlJustPressed(2, Config.Controls.Forward)) {
        Cached.Prone._lastKeyPressAt = GetGameTimer();
        if (!Cached.Prone._isCrawlInProgress) {
            Crawl(Ped, IsControlJustPressed(2, Config.Controls.Forward) ? Movements.Forward : Movements.Backward);
        }
    } else if (IsControlPressed(2, Config.Controls.Backward) || IsControlPressed(2, Config.Controls.Forward)) {
        if (Cached.Prone._lastKeyPressAt >= GetGameTimer() - Cached.Prone._debounceTime) return; // (Cached.Prone._debounceTime) is checked
        Cached.Prone._lastKeyPressAt = GetGameTimer();

        if (!Cached.Prone._isCrawlInProgress) {
            Crawl(Ped, IsControlPressed(2, Config.Controls.Forward) ? Movements.Forward : Movements.Backward);
        }
    }
    if (IsControlJustPressed(2, Config.Controls.Left) || IsControlJustPressed(2, Config.Controls.Right)) {
        Cached.Prone._debounceTime = 100; // This is used to determine how fast you should be crawling while turning left/right
        Cached.Prone._lastLeftRightPressAt = GetGameTimer();

        SetEntityHeading(Ped, IsControlJustPressed(2, Config.Controls.Left) ? GetEntityHeading(Ped) - 2 : GetEntityHeading(Ped) + 2);
    } else if (IsControlPressed(2, Config.Controls.Left) || IsControlPressed(2, Config.Controls.Right)) {
        Cached.Prone._debounceTime = 10; // This is used to determine how fast you should be crawling while turning left/right
        Cached.Prone._lastLeftRightPressAt = GetGameTimer();

        SetEntityHeading(Ped, IsControlPressed(2, Config.Controls.Left) ? GetEntityHeading(Ped) - 0.75 : GetEntityHeading(Ped) + 0.75);
    }
};

/**
 * @name Crawl
 * @description Handles the players' movements in the prone stnace
 * @param {*} Ped The players' ped
 * @param {*} Direction The players' ped
 * @returns returnless
 * @example Crawl(Ped, Movements.Forward)
 */
const Crawl = (Ped, Direction) => {
    if (Cached.Prone._isCrawlInProgress) return;
    Cached.Prone._isCrawlInProgress = true;

    const proneStateStr = Cached.stance === Stances.Prone.Stomach ? 'onfront' : 'onback';
    let movementStr;
    if (Cached.stance === Stances.Prone.Stomach) {
        movementStr = Direction === Movements.Forward ? 'fwd' : 'bwd';
    } else {
        movementStr = Direction === Movements.Forward ? 'bwd' : 'fwd';
    }
    const animStr = `${proneStateStr}_${movementStr}`;
    StopAnimTask(Ped, 'move_crawl', animStr, 0.0);
    TaskPlayAnim(Ped, 'move_crawl', animStr, 8, -8, -1, 2, 0);

    setTimeout(() => Cached.Prone._isCrawlInProgress = false, Cached.stance === Stances.Prone.Stomach ? Timers.ForwardCrawl : Timers.BackwardCrawl);
};

/**
 * @name handleProneAim
 * @description Handles the weapon aim while in prone stance
 * @param {*} Ped The players' ped
 * @returns returnless
 * @example handleProneAim(Ped)
 */
const handleProneAim = (Ped) => {
    const playerIsArmed = IsPedArmed(Ped, 4);
    if (playerIsArmed && Config.FireInProne && !Cached.Prone._isCrawlInProgress && !Cached.Prone._AimActive && IsControlPressed(2, Config.Controls.Aim)) {
        TaskAimGunScripted(Ped, GetHashKey('SCRIPTED_GUN_TASK_PLANE_WING'), true, true); // This is the same animation when Trevor was on the plane wing and shooting in Singleplayer

        if (!Cached.Prone._AimActive && Cached.stance === Stances.Prone.Back) {
            const [rX, rY, rZ] = GetEntityRotation(Ped, 5);
            SetEntityRotation(Ped, rX, rY, rZ + 180);
        }
        Cached.Prone._AimActive = true;

        // TODO: Sniper overlay will not occur w/ "SCRIPTED_GUN_TASK_PLANE_WING" no matter what. #TimothyDexter (https://forum.cfx.re/u/timothy_dexter)
        if (IsPedUsingSniper(Ped)) {
            DisplaySniperScopeThisFrame(); // shows the reticle while using a sniper
        }

    } else if (playerIsArmed && IsControlJustReleased(2, Config.Controls.Aim)) {
        TaskAimGunScripted(Ped, GetHashKey('SCRIPTED_GUN_TASK_PLANE_WING'), false, false);
        Cached.Prone._AimActive = false;
        if (Cached.stance === Stances.Prone.Back) {
            const [rX, rY, rZ] = GetEntityRotation(Ped, 5);
            SetEntityRotation(Ped, rX, rY, rZ + 180);
            UpdateProne(Ped, Stances.Prone.Back);
        }
    }
};

/**
 * @name IsPedUsingSniper
 * @description Checks if the passed ped is using a sniper
 * @param {*} Ped The players' ped
 * @returns Boolean
 * @example IsPedUsingSniper(Ped)
 */
const IsPedUsingSniper = (Ped) => {
    const currentWeapon = GetHashKey(GetCurrentPedWeapon(Ped, true));
    const snipers = [
        GetHashKey('weapon_sniperrifle'),
        GetHashKey('weapon_heavysniper'),
        GetHashKey('weapon_heavysniper_mk2'),
        GetHashKey('weapon_marksmanrifle'),
        GetHashKey('weapon_marksmanrifle_mk2'),
        '679988344'
    ];
    let checkSniperResult = false;

    for (const sniper in snipers) {
        if (currentWeapon === parseInt(sniper)) return checkSniperResult = true;
    }

    return checkSniperResult;
};

// ========================================================================================================================
//                                                     EXPORTS
//                                                 SETTERS/GETTERS
// ------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING
// ========================================================================================================================

exports('GetStance', () => Cached.stance);

exports('SetStance', Stance => AdvanceStance(Cached.ped, Stance));
