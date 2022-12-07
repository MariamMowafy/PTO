
//exclude men ui el dashboard this month and display only next month
//2 tables current month and next month

let nav = 1;
var x;
var current_user = localStorage.getItem['current_user']
currentUserPool =localStorage.getItem('current_user')[4]
currentUserLevel =localStorage.getItem('current_user')[6]
if(currentUserPool==0 && currentUserLevel==0){
  currentUserTitle= "Pool A - L1";
}
else if(currentUserPool==0 && currentUserLevel==1){
  currentUserTitle= "Pool A - L2";
}
else if(currentUserPool==1 && currentUserLevel==0){
  currentUserTitle= "Pool B - L1";
}
else if(currentUserPool==1 && currentUserLevel==1){
  currentUserTitle= "Pool B - L2";
}
console.log(localStorage.getItem('user')) 
saturdayCount=0;
saturdayDates=[];
saturdaysFetched=[];
let clicked = null;
let events = localStorage.getItem('events') ? JSON.parse(localStorage.getItem('events')) : [];
options = ['Avaya','Saturdays','PTO','Public','Other']
const calendar = document.getElementById('calendar');
const newEventModal = document.getElementById('newEventModal');
const deleteEventModal = document.getElementById('deleteEventModal');
const backDrop = document.getElementById('modalBackDrop');
const eventTitleInput = document.getElementById('eventTitleInput');
const weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
var owner_ = localStorage.getItem('user');
// var mysql = require('mysql');
console.log(owner_);
console.log(events);
flag= false;
satFlag=true;
//Saturdays:
//this should be customized later or keep as default
saturdayRequestedDepartments=['pool A - L1','pool B - L1','pool A - L2', 'pool B - L2','pool B - L1'];
//this should be fetched on login from database

var poolalevel1=0;
var poolalevel2=0;
var poolblevel2=0;
var poolblevel2=0;
var satindex;
var a1=0;
var a2=0;
var b1=0;
var b2=0;
currentUserPoolLevel=""+currentUserPool+""+currentUserLevel;
var satData=[];
var globalDateString="";

  
function openModal(date) {
  clicked = date;
  dateStr = clicked;
  globalDateString = dateStr;
  //handleSaturdays();
  var datestring = clicked.split("/");
  var dd = datestring[0];
  var mm = datestring[1];
  var yyyy = datestring[2];
  datestring = mm+"/"+dd+"/"+yyyy
  invertedDate = dd+"/"+mm+"/"+yyyy
  var dateObject = new Date(datestring);
  var invertedDateObject = new Date(invertedDate);
  var selectobject = document.getElementById("eventTitleInput"); 
  var checker;
  console.log("********************")
  console.log(currentUserTitle)
  console.log(poolalevel1)
  console.log("********************")
  if(currentUserTitle == 'Pool A - L1'){
    checker = poolalevel1
  }
  else if(currentUserTitle == 'Pool A - L2'){
    checker = poolalevel2
  }
  else if(currentUserTitle == 'Pool B - L1'){
    checker = poolblevel1
  }
  else if(currentUserTitle == 'Pool B - L2'){
    checker = poolblevel2
  }
  
  console.log("Checker: "+checker)
  console.log(invertedDateObject)
for (var i=0; i<selectobject.length; i++) {
  if( invertedDateObject.getDay() === 6 && flag==false && checker>0){
      console.log(true)
      const opt = document.createElement("option");
      opt.value = "Saturday";
      opt.text = "Saturday";
      selectobject.add(opt, null);
      flag=true;
  }
  else if(invertedDateObject.getDay() != 6 &&flag==true && selectobject.options[i].value == 'Saturday'){
      console.log(false)
      selectobject.remove(i);
      flag=false;
  }
  else if ( invertedDateObject.getDay() === 6 && flag == true && checker<=0 && selectobject.options[i].value == 'Saturday') {
    console.log(false)
    selectobject.remove(i);
    flag=false;
  }
}
//   for (var i=0; i<selectobject.length; i++) {

//   if ((selectobject.options[i].value == 'Saturday' && dateObject.getDay() != 6 && flag==true ) || (selectobject.options[i].value == 'Saturday' && dateObject.getDay() == 6 && flag==true && a1<=0)){
//     console.log("gpwa"+a1)
//     selectobject.remove(i);
//     flag=false;
 
//   }else if (flag==false){
//     console.log("vara " +a1)
//     const opt = document.createElement("option");
//     opt.value = "Saturday";
//     opt.text = "Saturday";
//     selectobject.add(opt, null);
//     flag=true;
//   } 
//   if (selectobject.options[i].value == 'Saturday' && dateObject.getDay() == 6 ){
//     var option = document.createElement("option");
//     option.text = "Saturday";
//     selectobject.add(option);
//   }
// }
//handleSaturdays();

  const eventForDay = events.find(e => e.date === clicked);

  if (eventForDay) {
    document.getElementById('eventText').innerText = eventForDay.title;
    document.getElementById('eventTitleInput').innerText=['test','the','change'];
    deleteEventModal.style.display = 'block';
  } else {
    newEventModal.style.display = 'block';
  }

  backDrop.style.display = 'block';
}

function load() {
  const dt = new Date();

  if (nav !== 0) {
    dt.setMonth(new Date().getMonth() + nav);
  }

  const day = dt.getDate();
  const month = dt.getMonth();
  const year = dt.getFullYear();

  const firstDayOfMonth = new Date(year, month, 1);
  const daysInMonth = new Date(year, month + 1, 0).getDate();
  
  const dateString = firstDayOfMonth.toLocaleDateString('en-us', {
    weekday: 'long',
    year: 'numeric',
    month: 'numeric',
    day: 'numeric',
  });
  const paddingDays = weekdays.indexOf(dateString.split(', ')[0]);

  document.getElementById('monthDisplay').innerText = 
    `${dt.toLocaleDateString('en-us', { month: 'long' })} ${year}`;

  calendar.innerHTML = '';

  for(let i = 1; i <= paddingDays + daysInMonth; i++) {
    const daySquare = document.createElement('div');
    daySquare.classList.add('day');

    const dayString = `${month + 1}/${i - paddingDays}/${year}`;
    //console.log(dayString);
    today = new Date(dayString);
    if(today.getDay()==6 &&  saturdayCount<5){
      saturdayCount++;
      saturdayDates.push(dayString);
    }
    if (i > paddingDays) {
      daySquare.innerText = i - paddingDays;
      const eventForDay = events.find(e => e.date === dayString);

      if (i - paddingDays === day && nav === 0) {
        daySquare.id = 'currentDay';
      }

      if (eventForDay) {
        const eventDiv = document.createElement('div');
        eventDiv.classList.add('event');
        eventDiv.innerText = eventForDay.title;
        daySquare.appendChild(eventDiv);
      }

      daySquare.addEventListener('click', () => getSaturdayReq(dayString));
    } else {
      daySquare.classList.add('padding');
    }

    calendar.appendChild(daySquare);    
  }
	for (i = 0; i < events.length; i++)
		console.log( events[i] );
  //again//console.log(saturdayCount);
  //console.log(saturdayDates);
}

function closeModal() {
  eventTitleInput.classList.remove('error');
  newEventModal.style.display = 'none';
  deleteEventModal.style.display = 'none';
  backDrop.style.display = 'none';
  eventTitleInput.value = '';
  clicked = null;
  //handleSaturdays();

  load();
}

function saveEvent() {
    //if user chose Saturday checker
  var dateStr = clicked;
  var dateObject = new Date(dateStr);


  if(eventTitleInput.value=='Saturday' && dateObject.getDay() === 6 && saturdayRequestedDepartments.filter(x => x=='').length!=saturdayRequestedDepartments.length){
   // if(currentUserPoolLevel)
      console.log('ekhtart Saturday');
      if (saturdayRequestedDepartments.includes(currentUserTitle)){
        console.log('exists');
        console.log(saturdaysFetched);
        //saturdayRequestedDepartments[saturdayRequestedDepartments.indexOf(currentUserTitle)]='';
        //console.log(saturdayRequestedDepartments);

        executeEvent();
      }
      else{
        //alert('This Saturday is taken, please choose another day')
        executeEvent();
      }
    }
   
    //if user chose PTO checker
    if(eventTitleInput.value=='PTO' ){
      console.log('ekhtart PTO');
      executeEvent();
      closeModal();
    }
    //if user chose Avaya checker
    if(eventTitleInput.value=='Avaya'){
      console.log('ekhtart Avaya');
      executeEvent();
      closeModal();
    }
    //if user chose Public checker
    if(eventTitleInput.value=='Public'){
      console.log('ekhtart Public');
      executeEvent();
      closeModal();
    }
    //if user chose Other checker
    if(eventTitleInput.value=='Other'){
      console.log('ekhtart Other');
      executeEvent();
      closeModal();
    }
    else closeModal();

}
function executeEvent(){
  
  if (eventTitleInput.value) {
    eventTitleInput.classList.remove('error');
	console.log(owner_);
  for(i=0;i<eventTitleInput.length;i++){
    if(options[i]==eventTitleInput.value){
      options[i]=""
    }
  }
  console.log(options)
    events.push({
      date: clicked,
      title: eventTitleInput.value,
	    requester: owner_,
    });


    localStorage.setItem('events', JSON.stringify(events));
    closeModal();
    
  } else {
    eventTitleInput.classList.add('error');
  }
}

function send_to_server(){

	(async () => {
    console.log("dakhalt el async");
		const rawResponse = await fetch('http://localhost:8080/savelist', {
			method: 'POST',
			headers: {
				'Accept': 'application/json',
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({"ownerID":1, "name":owner_, "pto":events})
		});
		const status_ = await rawResponse.json();
		console.log(status_['status']);
		
		if (status_['status'] == "OK") {
			console.log("Script FINE");
		}else{
			console.log("Script NOT OK");
		}
		console.log("hakhrog men el async");
	})();
	//Send data to server. remove user, events
	localStorage.removeItem("user");
	localStorage.removeItem("events");
	//load();
	console.log(localStorage.getItem('user'));
	console.log(localStorage.getItem('events'));
	events = [];
	load();
  console.log('sending to server');
  //update_saturday();
  //window.open("./thanks.html","_self");
  
	//window.open("./index.html","_self");
	
	/*console.log("Clicked~!!!!!");
	var xhr = new XMLHttpRequest();
	xhr.open("POST", 'http://localhost:8080/savelist', true);
	xhr.setRequestHeader('Content-Type', 'application/json');
	var obj = {"ownerID":1, "name":owner_, "pto":events};
	console.log(obj);
	xhr.send(JSON.stringify({
		"value": obj
	}));*/
	
}

function deleteEvent() {
  events = events.filter(e => e.date !== clicked);
  localStorage.setItem('events', JSON.stringify(events));
  closeModal();
}

function initButtons() {
  //error because we open another window and still call this so there is no button
  //in the new window with that ID

  // document.getElementById('backButton').addEventListener('click', () => {
  //  // nav--;
  //   load();
  // });
  document.getElementById('saveButton').addEventListener('click', saveEvent);
  document.getElementById('cancelButton').addEventListener('click', closeModal);
  document.getElementById('deleteButton').addEventListener('click', deleteEvent);
  document.getElementById('closeButton').addEventListener('click', closeModal);
  document.getElementById('submitButton').addEventListener('click', send_to_server);
  //document.getElementById('homepage').addEventListener('click', redirecttohomepage);
}

function getSaturdayReq(dayString){
  saturdaysFetched=[];
  (async () => {
		const rawResponse = await fetch('http://localhost:8080/getSaturdayRequirements', {
			method: 'GET',
			headers: {
				'Accept': 'application/json',
				'Content-Type': 'application/json'
			},
		});
		const sat = await rawResponse.json();
    var requirement;
    for(i=0;i<sat.length;i++){
      console.log("Sat [i][1]: "+sat[i][1])
      console.log("dayString: "+dayString)
      if(sat[i][1]==dayString){
        requirement = sat[i];
        break;
      }
      else{
        requirement = 0
      }
    }
		// requirement = sat[0];
    console.log(requirement)
    poolalevel1=requirement[2];
    poolalevel2=requirement[3];
    poolblevel1=requirement[4];
    poolblevel2=requirement[5];
    satData=sat
    openModal(dayString);
	})();

  console.log("khalast fetching saturday")
  
}

// function handleSaturdays(){
//   var datestring = globalDateString.split("/");
//   var mm = datestring[0];
//   var dd = datestring[1];
//   var yyyy = datestring[2];
//   var newDateFormat = dd+"/"+mm+"/"+yyyy
//   console.log(newDateFormat)

//   var exist = false;

//   for(i=0;i<satData.length;i++){
//     if(satData[i][1]==newDateFormat){
//       exist=true
//       satindex=i;
//       a1=satData[i][2];
//       a2=satData[i][3];
//       b1=satData[i][4];
//       b2=satData[i][5];
//     }
//   }
//   console.log(satFlag)
//   //if chosen one is saturday, check the pool and the level, if equal
//   //to my pool and level then continue and reduce the availability
// }

// function update_saturday(){

// 	(async () => {
//     console.log("dakhalt el update_saturday");
// 		const rawResponse = await fetch('http://localhost:8080/savesat', {
// 			method: 'POST',
// 			headers: {
// 				'Accept': 'application/json',
// 				'Content-Type': 'application/json'
// 			},
// 			body: JSON.stringify({ "pool_a_level_1":a1, "pool_a_level_2":a2, "pool_b_level_1":b1, "pool_b_level_2":b2,"date":globalDateString})
// 		});
// 		const status_ = await rawResponse.json();
// 		console.log(status_['status']);
		
// 		if (status_['status'] == "OK") {
// 			console.log("Script FINE");
// 		}else{
// 			console.log("Script NOT OK");
// 		}
// 		console.log("hakhrog men el async");
// 	})();
// }


initButtons();
load();
// function redirecttohomepage(){
//   window.open("./record.html","_self");
// }