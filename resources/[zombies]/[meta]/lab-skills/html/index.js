var playerPoint
var Locales

$('document').ready(function() {

    window.addEventListener('message', function(event) {
        var item = event.data;

        if (item.type == "systemNotify") {
            systemNotify(item.message,item.status)
        }
        if (item.type == "levelUp") {
            systemLevelNotify(item.message,item.status,item.level)
        }
        if (item.type == "closeScreen") {
            $('.full-screen').css({'display':'none'})
        }
        if (item.type == "openSkillScreen") {
            $('.full-screen').css({'display':'block'})
            $('.skill').html("")
            $('.player-name').text(item.playerName)
            $('.player-job').text('JOB: '+ item.playerJob)
            $('.player-level').text(item.skillInfo.currentlevel+' LVL')
            
            Locales = item.Locales
            playerPoint = item.skillInfo.skillpoints
            $('.player-skillpoint').text(playerPoint +' point')

            
            $.each(item.skills, function (i, v) { 
                let html = "";
                html += `
                <div class="skill-icon" data-openedskill=false id="${v.skill}" data-skillID="${v.skill}" data-BeforeOpenSkill="${v.BeforeOpenSkill}" data-AfterOpenSkills2="${v.AfterOpenSkills2}" data-AfterOpenSkills="${v.AfterOpenSkills}" data-skillPoint="${v.skillPoint}" data-skillName="${v.skillName}" data-skillDescription="${v.skillDescription}" data-skillGif="${v.skillGif}" style="margin-left: ${v.marginLeft}%;margin-top: ${v.marginTop}%;background-image: url(./img/${v.iconName}.png)"></div>`;
                
                $('.skill').append(html);
                
            });
            drawLines(item.Skillconfig)
            
            setTimeout(() => {
                $.each(item.skilldata, function (i, v) { 
                    let oldValue = {}
                    // connectOtherLine(i,v)
                    BeforeOpenSkill = $('#'+v+'').attr("data-BeforeOpenSkill")
                    // console.log('CONNECT =>',"#"+BeforeOpenSkill+"", "#"+v+"");
                    if (BeforeOpenSkill != "") {
                        $('#'+v).attr("data-openedskill", true)
                        jqSimpleConnect.connect( "#"+v+"", "#"+BeforeOpenSkill+"", {radius: 4, color: '#FBE101'});     
                    } else {
                        AfterOpenSkills = $('#'+v+'').attr("data-AfterOpenSkills")
                        AfterOpenSkills2 = $('#'+v+'').attr("data-AfterOpenSkills2")

                        jqSimpleConnect.connect( "#"+v+"", "#"+AfterOpenSkills+"", {radius: 4, color: '#FBE101'});     
                        jqSimpleConnect.connect( "#"+v+"", "#"+AfterOpenSkills2+"", {radius: 4, color: '#FBE101'});     
                    }

                    if (v == "StarterSkill") {
                        $('#'+v).attr("data-openedskill", true)

                    }
                });
            }, 350);

            // var a = $('#mydiv').data('myval'); //getter
            // $('#mydiv').data('myval',20); //setter
            $('.skill-icon').click(function (e) { 
                e.preventDefault();
                skillID = $(this).attr("data-skillID")
                // console.log('clicked Skills=>', skillID);
                skillName = $(this).attr("data-skillName")
                skillLabel = $(this).attr("data-skillDescription")
                skillPoint = $(this).attr("data-skillPoint")
                skillGif = $(this).attr("data-skillGif")
                AfterOpenSkills = $(this).attr("data-AfterOpenSkills")
                AfterOpenSkills2 = $(this).attr("data-AfterOpenSkills2")
                BeforeOpenSkill = $(this).attr("data-BeforeOpenSkill")
                skillIsAlreadyOpen = $("#"+skillID+"").attr("data-openedskill")
                // json('skillID skillsAlreadyOpen=>', skillID,skillIsAlreadyOpen)
                if (BeforeOpenSkill !== "") {
                    BeforeOpenedSkill = $("#"+BeforeOpenSkill+"").attr("data-openedskill")
                }
                if (skillID == "StarterSkill") {
                    playClickSound()
                    if (AfterOpenSkills2 !== "") {
                        jqSimpleConnect.connect("#"+skillID+"", "#"+AfterOpenSkills+"", {radius: 4, color: '#FBE101'});
                        jqSimpleConnect.connect("#"+skillID+"", "#"+AfterOpenSkills2+"", {radius: 4, color: '#FBE101'});
                    }  else {
                        jqSimpleConnect.connect("#"+skillID+"", "#"+AfterOpenSkills+"", {radius: 4, color: '#FBE101'});
                    }   
                    // jqSimpleConnect.connect( "#"+v+"", "#"+BeforeOpenSkill+"", {radius: 4, color: '#FBE101'});     
                    newPoint = playerPoint - skillPoint
                    if (newPoint >= 0) {
                        playerPoint = newPoint
                        skillPoint = Number(skillPoint)
                        $('.player-skillpoint').text(playerPoint +' point')
                        $('#'+skillID).attr("data-openedskill", true)
                        $.post("https://lab-skills/boughtSkill", JSON.stringify({skillID, skillPoint}))
                    } else {
                        systemNotify(Locales.EnoughSkillPoint, "succses")
                    }
                } else {
                    if (skillIsAlreadyOpen !== "true") { // skill zaten açılmış olmasın
                        if (BeforeOpenedSkill == "true") { // seçilen skillden bir öncesi kullanımda olması gereksin
                            playClickSound()
                            newPoint = playerPoint - skillPoint
                            if (newPoint >= 0) {
                                if (AfterOpenSkills2 !== "") {
                                    jqSimpleConnect.connect("#"+skillID+"", "#"+AfterOpenSkills+"", {radius: 4, color: '#FBE101'});
                                    jqSimpleConnect.connect("#"+skillID+"", "#"+AfterOpenSkills2+"", {radius: 4, color: '#FBE101'});
                                }  else {
                                    jqSimpleConnect.connect("#"+skillID+"", "#"+AfterOpenSkills+"", {radius: 4, color: '#FBE101'});
                                } 
                                jqSimpleConnect.connect("#"+skillID+"", "#"+BeforeOpenSkill+"", {radius: 4, color: '#FBE101'});

                                playerPoint = newPoint
                                skillPoint = Number(skillPoint)
                                $('.player-skillpoint').text(playerPoint +' point')
                                $('#'+skillID).attr("data-openedskill", true)
                                $.post("https://lab-skills/boughtSkill", JSON.stringify({skillID, skillPoint}))
                            } else {
                                systemNotify(Locales.EnoughSkillPoint, "error")
                            }
                        }
                    }
                }
                
            });

            //INFO SIDE  
            $(".skill-icon").mouseover(function(e) {

                let itemOffset = { top: e.pageY, left: e.pageX };

                // $(".info-area").css("top", itemOffset.top);
            
                let leftOffset = itemOffset.left + 5;
            
                //Prevent from going offscreen.
                if (leftOffset + $(".info-area").width() > $(window).width()) {
                  leftOffset = $(window).width() - $(".info-area").width() - 300;
                  
                }
                let topOffSet = itemOffset.top - 100;
            
                //Prevent from going offscreen.
                if (topOffSet + $(".info-area").height() > $(window).height()) {
                    topOffSet = $(window).height() - $(".info-area").height() - 400;
                  
                }

                $(".info-area").css("margin-left", leftOffset);
                $(".info-area").css("margin-top", topOffSet);
                $(".info-area").fadeIn(0);

                
                skillID = $(this).attr("data-skillID")
                skillName = $(this).attr("data-skillName")
                skillLabel = $(this).attr("data-skillDescription")
                skillPoint = $(this).attr("data-skillPoint")
                skillGif = $(this).attr("data-skillGif")
                $('.info-skillName').text(skillName)
                $('.info-skillLabel').text(skillLabel)
                $('.info-skillPoint').text(skillPoint+' Point')
                if (playerPoint >= skillPoint) {
                    $('.info-skillpoint').css({'color':'#56FF28'})
                }
                if (playerPoint <= skillPoint) {
                    $('.info-skillpoint').css({'color':'#FF2828'})
                }
                if (skillGif !== "") {
                    $('.info-skillGif').css({'background-image':'url('+skillGif+')'})
                } else {
                    $('.info-skillGif').css({'background-image':'url(https://cdn.discordapp.com/attachments/919180635388653618/1023918298557071440/Logo_tmp.gif)'})
                }
            });     
            $(".skill-icon").mouseout(function (e) { 
                $(".info-area").fadeOut(0);
                
            });       
        }
    })
})





drawLines = function(Config) {
    $.each(Config, function (i, v) { 
        // console.log('[ DRAW LINES ]', v.skill, v.AfterOpenSkills, v.BeforeOpenSkill);
        if (v.BeforeOpenSkill !== "") {
            jqSimpleConnect.connect("#"+v.skill+"", "#"+v.BeforeOpenSkill+"", {radius: 1, color: '#878787b0'});
        }
    });
}


function playClickSound() {
    var audio = document.getElementById("click1");
    audio.volume = 0.3;
    audio.play();
}
function levelupSound() {
    var levelUp_Sound = new Audio("sounds/levelup.mp3");
    levelUp_Sound.volume = 0.1;
    levelUp_Sound.play();
}


systemLevelNotify = function(message, status,level) {
    levelupSound()
    // console.log(message, status,level)
    if (status == "error") {
        $(".levelup-skill-headerside-level").text(level)
        $(".levelup-skill-notify").animate({top: "79vh"},2300, function() {
            $(".levelup-skill-notify").animate({top: "105vh"}, 1600)
        });
    }
    if (status == "success") {
        $(".levelup-skill-headerside-level").text(level)
        $(".levelup-skill-notify").animate({top: "79vh"},2300, function() {
            $(".levelup-skill-notify").animate({top: "105vh"}, 1600)
        });
    }
}
systemNotify = function(message, status) {
    if (status == "error") {
        $(".notify-header").text("ERROR")
        $(".notify-line").text(message)  
        $(".system-notify").animate({top: "6vh"},1300, function() {
        $(".system-notify").animate({top: "-12vh"}, 1600)
        });
    }
    if (status == "success") {
        $(".notify-header").text("SUCCESS")
        $(".notify-line").text(message)  
        $(".system-notify").animate({top: "6vh"},1300, function() {
        $(".system-notify").animate({top: "-12vh"}, 1600)
        });
    }
}


$('document').ready(function() {
    document.onkeyup = function (data) {
        if (data.which == 27 ) {
            closeScreen()
        }
    };
})

closeScreen = function() {
    $('.full-screen').css({'display':'none'})

    $.post("https://lab-skills/closeScreen", JSON.stringify())

}

