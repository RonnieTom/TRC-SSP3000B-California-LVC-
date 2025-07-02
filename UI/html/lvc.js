/*
--------------------------------------------------
LUXART 车辆控制 V3（适用于 FIVEM）
--------------------------------------------------
TrevorBarns 制作
--------------------------------------------------
本程序为免费软件：您可以根据自由软件基金会发布的 GNU 通用公共许可证（许可证第 3 
版或（根据您的选择）任何更高版本）对其进行重新分发和/或修改。

本程序分发时希望其能够发挥作用，
但不提供任何担保；甚至不提供关于
适销性或特定用途适用性的默示担保。有关更多详细信息，请参阅
GNU 通用公共许可证。

您应该已随本程序收到一份 GNU 通用公共许可证的副本。如果没有，请参阅 <https://www.gnu.org/licenses/>。
---------------------------------------------------
*/

var resourceName = "";
var time_folder = "day/";
var ta_pattern = "ta/pattern_3/";
var audioPlayer = null;
var soundID = 0;
var scale = 0.6;
var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
var codeHudInterval = null;
var codeHudState = false;
var auxInterval = null;
var auxActive = false;
var parkInterval = null;
var parkActive = false;
var rightAlleyInterval = null;
var rightAlleyActive = false;
var leftAlleyInterval = null;
var leftAlleyActive = false;
var paActive = false;
var mainSirenActive = false;
var currentBg = null;

const elements = 
{
	sirenbox: 	document.getElementById("sirenbox"),
	lswitch: 	document.getElementById("slide"),
	siren: 		document.getElementById("siren"),
	horn: 		document.getElementById("horn"),
	tkd: 		document.getElementById("tkd"),
	lock: 		document.getElementById("lock"),
	ta: 		document.getElementById("ta"),
}

const backup = 
{ 
	left: elements.sirenbox.style.left, 
	top: elements.sirenbox.style.top,
}


window.addEventListener('message', function(event) {
	var type = event.data._type;
	if (type == "audio") {
		playSound(event.data.file, event.data.volume);
	}else if ( type == "setResourceName" ) {
		resourceName = event.data.name
	}else if (type == "hud:setItemState") {

		var item = event.data.item;
		var state = event.data.state;
		
		switch ( item ){
			case "hud":
				if ( state == true ) {
					elements.sirenbox.style.display = "inline";
				}else{
					elements.sirenbox.style.display = "none";
				}
				break;
			case "switch":
				if ( state == true ) {
					elements.lswitch.src= "../textures/"+ time_folder + "slide_on.png";
					startCodeHud();
				}else{
					elements.lswitch.src= "../textures/"+ time_folder + "slide_off.png";
					stopCodeHud();
					// 兜底：警灯关闭时强制隐藏PA
					document.getElementById("pa_hud").style.display = "none";
				}
				break;
			case "siren":
				mainSirenActive = state;
				elements.siren.style.visibility = "visible";
				if ( state == true ) {
					elements.siren.src= "../textures/" + time_folder + "siren_on.png";
					if(currentBg !== "on"){
						document.getElementById("sirenbox").style.backgroundImage = 'url("../textures/background_on.png")';
						currentBg = "on";
					}
				}else{
					elements.siren.src= "../textures/" + time_folder + "siren_off.png";
					if(currentBg !== "off"){
						document.getElementById("sirenbox").style.backgroundImage = 'url("../textures/background_off.png")';
						currentBg = "off";
					}
				}
				break;
			case "horn":
				if ( state == true ) {
					elements.horn.src= "../textures/" + time_folder + "horn_on.png";					
				}else{
					elements.horn.src= "../textures/" + time_folder + "horn_off.png";
				}				
				break;
			case "tkd":
				if ( state == true ) {
					elements.tkd.src= "../textures/" + time_folder + "tkd_on.png";					
				}else{
					elements.tkd.src= "../textures/" + time_folder + "tkd_off.png";
				}			
				break;			
			case "lock":
				if ( state == true ) {
					elements.lock.src= "../textures/" + time_folder + "lock_on.png";					
				}else{
					elements.lock.src= "../textures/" + time_folder + "lock_off.png";
				}				
				break;
			case "ta":
				if ( state == 1 ) {
					elements.ta.src = "../textures/" + ta_pattern + "ta_left.gif";
				}else if ( state == 2 ){
					elements.ta.src = "../textures/" + ta_pattern + "ta_right.gif";
				}else if ( state == 3 ){
					elements.ta.src = "../textures/" + ta_pattern + "ta_center.gif";
				}else if ( state == 0 ){
					elements.ta.src = "../textures/" + time_folder + "ta_off.gif";
				}
				break;			
			case "ta_pattern":
					ta_pattern = "ta/pattern_" + state + "/"
					break;
			case "time":
					time_folder = state + "/"
					break;
			default:
				break;
		}
	}else if ( type == "hud:setHudScale" ){
		scale = event.data.scale
		elements.sirenbox.style.transform = "scale(" + scale + " )";
	}else if ( type == "hud:getHudScale" ){
		sendData( "hud:sendHudScale", scale = scale );
	}else if ( type == "hud:setHudPosition" ){
		elements.sirenbox.style.left = event.data.pos.left;
		elements.sirenbox.style.top = event.data.pos.top;
	}else if ( type == "hud:resetPosition" ){
		elements.sirenbox.style.left = backup.left;
		elements.sirenbox.style.top = backup.top;
	}else if (type == "hud:showManon") {
		var show = event.data.show;
		var manon = document.getElementById("manon");
		var siren = document.getElementById("siren");
		if (show) {
			manon.style.display = "block";
			siren.style.visibility = "hidden";
			sirenboxLock = true;
		} else {
			manon.style.display = "none";
			siren.style.visibility = "visible";
			sirenboxLock = false;
		}
	}else if (type == "hud:setExtraHud") {
		var extra = event.data.extra; // left/right/aux/park
		var show = event.data.show;
		setExtraHud(extra, show);
	}else if (type == "hud:showPA") {
		var show = event.data.show;
		var pa = document.getElementById("pa_hud");
		paActive = show;
		if (show) {
			pa.style.display = "block";
			if (!mainSirenActive) {
				elements.siren.src = "../textures/" + time_folder + "siren_off.png";
				document.getElementById("sirenbox").style.backgroundImage = 'url("../textures/background_off.png")';
			}
		} else {
			pa.style.display = "none";
			if (mainSirenActive) {
				elements.siren.src = "../textures/" + time_folder + "siren_on.png";
				document.getElementById("sirenbox").style.backgroundImage = 'url("../textures/background_on.png")';
			}
		}
	}else if (type == "hud:setEngineState") {
		var running = event.data.running;
		if (!running) {
			if(currentBg !== "xh"){
				document.getElementById("sirenbox").style.backgroundImage = 'url("../textures/background_xh.png")';
				currentBg = "xh";
			}
		} else {
			if (mainSirenActive) {
				if(currentBg !== "on"){
					document.getElementById("sirenbox").style.backgroundImage = 'url("../textures/background_on.png")';
					currentBg = "on";
				}
			} else {
				if(currentBg !== "off"){
					document.getElementById("sirenbox").style.backgroundImage = 'url("../textures/background_off.png")';
					currentBg = "off";
				}
			}
		}
	}
});


// Exit HUD Move Mode 
$( document ).keyup( function( event ) {
	//					Esc				Backspace				Space
	if ( event.keyCode == 27 || event.keyCode == 9 || event.keyCode == 32 ) 
	{
		sendData( "hud:setHudPositon", data = { left: elements.sirenbox.style.left, top: elements.sirenbox.style.top } );
		sendData( "hud:setMoveState", state = false );
	}
} );

$( document ).contextmenu( function() {
		sendData( "hud:setHudPositon", data = { left: elements.sirenbox.style.left, top: elements.sirenbox.style.top } );
		sendData( "hud:setMoveState", state = false );
} );


// This function is used to send data back through to the LUA side 
function sendData( name, data ) {
	$.post( "https://"+ resourceName +"/" + name, JSON.stringify( data ), function( datab ) {
		if ( datab != "ok" ) {
			console.log( datab );
		}            
	} );
}


//Credit to xotikorukx playSound Fn.
function playSound(file, volume){
  if (audioPlayer != null) {
	audioPlayer.pause();
  }

  soundID++;

  audioPlayer = new Audio("../sounds/" + file + ".ogg");
  audioPlayer.volume = volume;
  var didPlayPromise = audioPlayer.play();

  if (didPlayPromise === undefined) {
	audioPlayer = null; //The audio player crashed. Reset it so it doesn't crash the next sound.
  } else {
	didPlayPromise.then(_ => { //This does not execute until the audio is playing.
	}).catch(error => {
	  audioPlayer = null; //The audio player crashed. Reset it so it doesn't crash the next sound.
	})
  }
}
  
  
// Drag to move functions below.
elements.sirenbox.onmousedown = dragMouseDown;

function dragMouseDown(e) {
  e = e || window.event;
  e.preventDefault();
  // get the mouse cursor position at startup:
  pos3 = e.clientX;
  pos4 = e.clientY;
  document.onmouseup = closeDragElement;
  // call a function whenever the cursor moves:
  document.onmousemove = elementDrag;
}

function elementDrag(e) {
  e = e || window.event;
  e.preventDefault();
  // calculate the new cursor position:
  pos1 = pos3 - e.clientX;
  pos2 = pos4 - e.clientY;
  pos3 = e.clientX;
  pos4 = e.clientY;
  // set the element's new position:
  elements.sirenbox.style.top = (elements.sirenbox.offsetTop - pos2) + "px";
  elements.sirenbox.style.left = (elements.sirenbox.offsetLeft - pos1) + "px";
}

function closeDragElement() {
  // stop moving when mouse button is released:
  document.onmouseup = null;
  document.onmousemove = null;
}

function isAnyExtraGuideActive() {
    var ids = ["extra_left", "extra_right", "extra_aux", "extra_park"];
    return ids.some(id => {
        var el = document.getElementById(id);
        return el && el.style.display === "block";
    });
}

function startCodeHud() {
	if (codeHudInterval) return;
	var codeL = document.getElementById("codeL");
	var codeR = document.getElementById("codeR");
	let showL = true;
	if (isAnyExtraGuideActive()) {
		codeL.style.display = "none";
		codeR.style.display = "none";
		return;
	}
	codeL.style.display = "block";
	codeR.style.display = "none";
	codeHudInterval = setInterval(function() {
		if (isAnyExtraGuideActive()) {
			codeL.style.display = "none";
			codeR.style.display = "none";
			return;
		}
		if (showL) {
			codeL.style.display = "none";
			codeR.style.display = "block";
		} else {
			codeL.style.display = "block";
			codeR.style.display = "none";
		}
		showL = !showL;
	}, 800);
}

function stopCodeHud() {
	if (codeHudInterval) {
		clearInterval(codeHudInterval);
		codeHudInterval = null;
	}
	var codeL = document.getElementById("codeL");
	var codeR = document.getElementById("codeR");
	codeL.style.display = "none";
	codeR.style.display = "none";
}

function setExtraHud(type, show) {
	var map = {
		left: document.getElementById("extra_left"),
		right: document.getElementById("extra_right"),
		aux: document.getElementById("extra_aux"),
		park: document.getElementById("extra_park")
	};
	var codeL = document.getElementById("codeL");
	var codeR = document.getElementById("codeR");
	if (show) {
		map[type].style.display = "block";
		if (type === "aux") startAuxHud();
		if (type === "park") startParkHud();
		if (type === "right") startRightAlleyHud();
		if (type === "left") startLeftAlleyHud();
		// 只要有一个extra guide显示，隐藏codeL/codeR
		codeL.style.display = "none";
		codeR.style.display = "none";
	} else {
		map[type].style.display = "none";
		if (type === "aux") stopAuxHud();
		if (type === "park") stopParkHud();
		if (type === "right") stopRightAlleyHud();
		if (type === "left") stopLeftAlleyHud();
		// 检查所有extra guide都关闭后，恢复codeL/codeR
		var anyExtraVisible = false;
		for (var key in map) {
			if (map[key].style.display === "block") {
				anyExtraVisible = true;
				break;
			}
		}
		if (!anyExtraVisible && elements.lswitch.src.indexOf("slide_on.png") !== -1) {
			startCodeHud();
		}
	}
}

var auxInterval = null;
function startAuxHud() {
	if (auxInterval) return;
	var auxA = document.getElementById("extra_aux_a");
	var auxB = document.getElementById("extra_aux_b");
	auxA.style.display = "block";
	auxB.style.display = "none";
	let showA = false;
	auxInterval = setInterval(function() {
		showA = !showA;
		auxA.style.display = showA ? "block" : "none";
		auxB.style.display = showA ? "none" : "block";
	}, 1000);
}

function stopAuxHud() {
	if (auxInterval) {
		clearInterval(auxInterval);
		auxInterval = null;
	}
	var auxA = document.getElementById("extra_aux_a");
	var auxB = document.getElementById("extra_aux_b");
	auxA.style.display = "none";
	auxB.style.display = "none";
}

function startParkHud() {
	if (parkInterval) return;
	var parkA = document.getElementById("extra_park_a");
	var parkB = document.getElementById("extra_park_b");
	parkA.style.display = "block";
	parkB.style.display = "none";
	let showA = false;
	parkInterval = setInterval(function() {
		showA = !showA;
		parkA.style.display = showA ? "block" : "none";
		parkB.style.display = showA ? "none" : "block";
	}, 2000);
}

function stopParkHud() {
	if (parkInterval) {
		clearInterval(parkInterval);
		parkInterval = null;
	}
	var parkA = document.getElementById("extra_park_a");
	var parkB = document.getElementById("extra_park_b");
	parkA.style.display = "none";
	parkB.style.display = "none";
}

function startRightAlleyHud() {
	if (rightAlleyInterval) return;
	var ids = ["extra_right_a","extra_right_b","extra_right_c","extra_right_d","extra_right_e","extra_right_f","extra_right_g","extra_right_h","extra_right_i"];
	var imgs = ids.map(id => document.getElementById(id));
	let idx = 0;
	imgs.forEach((img, i) => img.style.display = i === 0 ? "block" : "none");
	rightAlleyInterval = setInterval(function() {
		imgs.forEach(img => img.style.display = "none");
		idx = (idx + 1) % imgs.length;
		imgs[idx].style.display = "block";
	}, 200);
}

function stopRightAlleyHud() {
	if (rightAlleyInterval) {
		clearInterval(rightAlleyInterval);
		rightAlleyInterval = null;
	}
	var ids = ["extra_right_a","extra_right_b","extra_right_c","extra_right_d","extra_right_e","extra_right_f","extra_right_g","extra_right_h","extra_right_i"];
	ids.forEach(id => document.getElementById(id).style.display = "none");
}

function startLeftAlleyHud() {
	if (leftAlleyInterval) return;
	var ids = ["extra_left_a","extra_left_b","extra_left_c","extra_left_d","extra_left_e","extra_left_f","extra_left_g","extra_left_h","extra_left_i"];
	var imgs = ids.map(id => document.getElementById(id));
	let idx = 0;
	imgs.forEach((img, i) => img.style.display = i === 0 ? "block" : "none");
	leftAlleyInterval = setInterval(function() {
		imgs.forEach(img => img.style.display = "none");
		idx = (idx + 1) % imgs.length;
		imgs[idx].style.display = "block";
	}, 200);
}

function stopLeftAlleyHud() {
	if (leftAlleyInterval) {
		clearInterval(leftAlleyInterval);
		leftAlleyInterval = null;
	}
	var ids = ["extra_left_a","extra_left_b","extra_left_c","extra_left_d","extra_left_e","extra_left_f","extra_left_g","extra_left_h","extra_left_i"];
	ids.forEach(id => document.getElementById(id).style.display = "none");
}
