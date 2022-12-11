
var requests=[]
var usernames = []



function getData(){

	//window.open("./thanks.html","_self");
  //console.log('Fetching from server');

	(async () => {
		const rawResponse = await fetch('http://localhost:8080/getAll', {
			method: 'GET',
			headers: {
				'Accept': 'application/json',
				'Content-Type': 'application/json'
			},
			//body: JSON.stringify({"ownerID":1, "name":owner_, "pto":events})
		});
		const status_ = await rawResponse.json();
		viewData(status_);
		//console.log(status_['status']);
		//console.log("de el status: " +status_);
		//console.log(status_)
	})();
}
function getUsers(){

	//window.open("./thanks.html","_self");
  //console.log('Fetching from server');
	
	(async () => {
		
		const rawResponse2 = await fetch('http://localhost:8080/getUsers', {
			method: 'GET',
			headers: {
				'Accept': 'application/json',
				'Content-Type': 'application/json'
			},
			//body: JSON.stringify({"ownerID":1, "name":owner_, "pto":events})
		});
		
		const status_2 = await rawResponse2.json();
		viewUsers(status_2);
		//console.log(status_['status']);
		//console.log("de el status: " +status_);
		//console.log(status_)
	})();
	
}
function viewUsers(data){
	nameIndex=1;
	ismodIndex=3;
	poolIndex=4;
	levelIndex=5;
	for(i=0;i<data.length;i++){;
		usernames.push({'name': data[i][nameIndex],'isMod': data[i][ismodIndex],'pool':data[i][poolIndex],'level':data[i][levelIndex],'skill':data[i][6]})
	}
	//console.log(usernames);
}
function viewData(data,callback){
	//console.log(data);
	//console.log(data.length)
	//tablebody = document.getElementById('tbody');
	console.log(usernames[0])
	id=[]
	ownerID=[]
	timestamp=[]
	ownerName=[]
	ptolist=[]
	for(i=0;i<data.length;i++){
		id.push(data[i][0]);
		// var row = tablebody.insertRow(0);
		// var cell0 = row.insertCell(0);
		// cell0.innerHTML = id[i];

		ownerID.push(data[i][1]);
		// var cell1 = row.insertCell(1);
		// cell1.innerHTML = ownerID[i];

		timestamp.push(data[i][2]);
		// var cell2 = row.insertCell(2);
		// cell2.innerHTML = timestamp[i];

		ownerName.push(data[i][3]);
		// var cell3 = row.insertCell(3);
		// cell3.innerHTML = ownerName[i];

		ptolist.push(data[i][4]);
		// var cell4 = row.insertCell(4);
		// cell4.innerHTML = ptolist[i];
		//tablebody.append(data[i][0]);
		
		// ownerID.push(data[i][1]);
		// timestamp.push(data[i][2]);
		// ownerName.push(data[i][3]);
		// ptolist.push(data[i][4]);
	}
	//const initialSplit = {id:id,ownerID:ownerID,timestamp:timestamp,ownerName:ownerName,ptolist:ptolist}
	splitPto(id,ownerID,timestamp,ownerName,ptolist);
	


}

//check to eclude old data

function splitPto(id,ownerID,timestamp,ownerName,ptolist){
	//console.log("da men function el akheera " + id,ownerID,timestamp,ownerName,ptolist);
	test=JSON.parse(ptolist[0])
	//console.log(ptolist.length)
	splittingPTO = [];
	splitted = []
	flag1=false
	flag2=false
	flag3=false
	flag4=false
	for(i=0;i<ptolist.length;i++){
		splitted.push(ptolist[i])
	}
	//console.log(splitted[1][20]);
	start=0
	end=11
	flag=false
	tablebody = document.getElementById('tbody');
	tablebody_1 = document.getElementById('tbody_1');
	tablebody_2 = document.getElementById('tbody_2');
	tablebody_3 = document.getElementById('tbody_3');
	console.log("********" + tablebody)
	console.log("********" + tablebody_2)
	for(i=0;i<splitted.length;i++){
		
		splittingPTO.push(ptolist[i].split(" ",end));
		start = start+end;
		end=end+7;
		if(tablebody!=null){
		var row = tablebody.insertRow(0);
		var row_1 = tablebody_1.insertRow(0);
		}
		if(tablebody_2!=null){
		var row_2 = tablebody_2.insertRow(0);
		var row_3 = tablebody_3.insertRow(0);
		}

		
		for(i=0;i<ptolist.length;i++){
			temp=JSON.parse(ptolist[i])
			users = usernames
			for(j=0;j<temp.length;j++){
	
			for(z=0;z<users.length;z++){	
				if(users[z]['name']==temp[j]['requester']&& temp[j]['title']=='Saturday' && tablebody!=null){
						now = new Date(temp[j]['date']);
						currentMonth = new Date();
						currentMonth = currentMonth.getMonth();
						if(currentMonth==11){
							currentMonth=0
						}
						else{
							currentMonth=currentMonth+1
						}
						console.log(now.getMonth() + "**********")
						console.log(currentMonth + "*******")
						if(now.getMonth()==currentMonth){
							var cell0 = row.insertCell(0);
							var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
							var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
							

							cell0.innerHTML = now.getDate() + ' ' + months[now.getMonth()] + ' ' + now.getFullYear();
						
							// var cell1 = row.insertCell(1);
							// cell1.innerHTML = temp[j]['title'];

							
							var cell2 = row.insertCell(1);
							cell2.innerHTML = temp[j]['requester'];

							var cell3 = row.insertCell(2);
							var y;
								if(users[z]['pool']==0){
									y='Pool A';
									cell3.innerHTML = 'Pool A';
								} else{
									y='Pool B';
									cell3.innerHTML = 'Pool B';
								}
							var cell4 = row.insertCell(3);
							var x;
							if(users[z]['level']==0){
								x='Level 1';
								cell4.innerHTML = 'Level 1';
							} else{
								x='Level 1';
								cell4.innerHTML = 'Level 2';
							}
							
							var cell5 = row.insertCell(4);
							//cell5.innerHTML = "To be determined";
							//console.log(users);
							cell5.innerHTML = users[z]['skill'];
							//console.log(splittingPTO[i].length)
							row = tablebody.insertRow(0);
							requests.push({date: now.getDate() + ' ' + months[now.getMonth()] + ' ' + now.getFullYear(),type:temp[j]['title'],name:temp[j]['requester'],pool:y,level:x,skill:users[z]['skill']})
						} else{
							var cell0 = row_1.insertCell(0);
							var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
							var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
							

							cell0.innerHTML = now.getDate() + ' ' + months[now.getMonth()] + ' ' + now.getFullYear();
						
							// var cell1 = row_1.insertCell(1);
							// cell1.innerHTML = temp[j]['title'];

							
							var cell2 = row_1.insertCell(1);
							cell2.innerHTML = temp[j]['requester'];

							var cell3 = row_1.insertCell(2);
							var y;
								if(users[z]['pool']==0){
									y='Pool A';
									cell3.innerHTML = 'Pool A';
								} else{
									y='Pool B';
									cell3.innerHTML = 'Pool B';
								}
							var cell4 = row_1.insertCell(3);
							var x;
							if(users[z]['level']==0){
								x='Level 1';
								cell4.innerHTML = 'Level 1';
							} else{
								x='Level 1';
								cell4.innerHTML = 'Level 2';
							}
							
							var cell5 = row_1.insertCell(4);
							//cell5.innerHTML = "To be determined";
							//console.log(users);
							cell5.innerHTML = users[z]['skill'];
							//console.log(splittingPTO[i].length)
							row_1 = tablebody_1.insertRow(0);
							requests.push({date: now.getDate() + ' ' + months[now.getMonth()] + ' ' + now.getFullYear(),type:temp[j]['title'],name:temp[j]['requester'],pool:y,level:x,skill:users[z]['skill']})
						
						}
					}	
			else if(users[z]['name']==temp[j]['requester']&& temp[j]['title']!='Saturday'&& tablebody_2!=null){
				now = new Date(temp[j]['date']);
				currentMonth = new Date();
				currentMonth = currentMonth.getMonth();
				if(currentMonth==11){
					currentMonth=0
				}
				else{
					currentMonth=currentMonth+1
				}
				console.log(now.getMonth() + "**********")
				console.log(currentMonth + "*******")
				if(now.getMonth()==currentMonth){
					var cell3 = row_2.insertCell(0);
					var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
					var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
					cell3.innerHTML = now.getDate() + ' ' + months[now.getMonth()] + ' ' + now.getFullYear();
	
				
					var cell4 = row_2.insertCell(1);
					cell4.innerHTML = temp[j]['title'];
	
					
					var cell5 = row_2.insertCell(2);
					cell5.innerHTML = temp[j]['requester'];
					//console.log(splittingPTO[i].length)

					var cell6 = row_2.insertCell(3);
						var y;
							if(users[z]['pool']==0){
								y='Pool A';
								cell6.innerHTML = 'Pool A';
							} else{
								y='Pool B';
								cell6.innerHTML = 'Pool B';
							}

					var cell7 = row_2.insertCell(4);
						var x;
						if(users[z]['level']==0){
							x='Level 1';
							cell7.innerHTML = 'Level 1';
						} else{
							x='Level 1';
							cell7.innerHTML = 'Level 2';
						}
						
						var cell8 = row_2.insertCell(5);
						//cell5.innerHTML = "To be determined";
						//console.log(users);
						cell8.innerHTML = users[z]['skill'];
						//console.log(splittingPTO[i].length)
						row_2 = tablebody_2.insertRow(0);
					//requests.push({date: now.getDate() + ' ' + months[now.getMonth()] + ' ' + now.getFullYear(),type:temp[j]['title'],name:temp[j]['requester'],pool:null,level:null})
			
		} else{
			var cell3 = row_3.insertCell(0);
			var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
			var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
			cell3.innerHTML = now.getDate() + ' ' + months[now.getMonth()] + ' ' + now.getFullYear();

		
			var cell4 = row_3.insertCell(1);
			cell4.innerHTML = temp[j]['title'];

			
			var cell5 = row_3.insertCell(2);
			cell5.innerHTML = temp[j]['requester'];
			//console.log(splittingPTO[i].length)

			var cell6 = row_3.insertCell(3);
				var y;
					if(users[z]['pool']==0){
						y='Pool A';
						cell6.innerHTML = 'Pool A';
					} else{
						y='Pool B';
						cell6.innerHTML = 'Pool B';
					}

			var cell7 = row_3.insertCell(4);
				var x;
				if(users[z]['level']==0){
					x='Level 1';
					cell7.innerHTML = 'Level 1';
				} else{
					x='Level 1';
					cell7.innerHTML = 'Level 2';
				}
				
				var cell8 = row_3.insertCell(5);
				//cell5.innerHTML = "To be determined";
				//console.log(users);
				cell8.innerHTML = users[z]['skill'];
				//console.log(splittingPTO[i].length)
				row_3 = tablebody_3.insertRow(0);
			
		}
	}
	}
	}
		}
	}
	console.log(requests)
	//visualize(console.log(requests));
}
function visualize(data){
// // 	point=data;
// 	var chart = JSC.chart('chartDiv', {
// 		debug: true,
// 		type: 'column',
// 		//title_label_text: 'Saturday capacity',
// 		legend_visible: false,
// 		yAxis_defaultTick_label_text: '%value%',
// 		yAxis: {
// 			scale:{
// 				range: [0,100]
// 			}
// 		},
// 		xAxis: {
// 		  defaultTick: {
// 			placement: 'inside',
// 			label: {
// 			  color: 'white',
// 			  style: { fontWeight: 'bold', fontSize: 16 }
// 			}
// 		  }
// 		},
// 		series: [
// 		  {
// 			defaultPoint: {
// 			  tooltip: '<b>%yValue%</b> of the capacity is taken',
// 			  marker: { visible: true, size: 40, fill: 'azure' },
// 			  label_text: '%value%'
// 			},
// 			name: 'Users with access',
// 			points: 
// 			//point
// 			[

// 			  {
// 				name: 'Saturday 1',
// 				y: Math.round(4/6 *100),
// 				marker_type: '1'
// 			  },
// 			  {
// 				name: 'Saturday 2',
// 				y: Math.round(3/6 *100),
// 				marker_type: '2'
// 			  },
// 			  {
// 				name: 'Saturday 3',
// 				y: Math.round(6/6 *100),
// 				marker_type: '3'
// 			  },
// 			  {
// 				name: 'Saturday 4',
// 				y: Math.round(5/6 *100),
// 				marker_type: '4'
// 			  }
// 			]
// 		  }
// 		]
// 	  });
}
//new
function postRequirements(){
	date= document.getElementById("date").value;
	pal1= document.getElementById("poolalevel1").value;
	pal2= document.getElementById("poolalevel2").value;
	pbl1= document.getElementById("poolblevel1").value;
	pbl2= document.getElementById("poolblevel2").value;
	(async () => {
		console.log("dakhalt el async");
			const rawResponse = await fetch('http://localhost:8080/savesat', {
				method: 'POST',
				headers: {
					'Accept': 'application/json',
					'Content-Type': 'application/json'
				},
				//payload['date'], payload['pool_a_level_1'], payload['pool_a_level_2'], payload['pool_b_level_1'], payload['pool_b_level_2']
				body: JSON.stringify({"date":date, "pool_a_level_1":pal1, "pool_a_level_2":pal2, "pool_b_level_1":pbl1, "pool_b_level_2":pbl2})
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
}
//new
function initButtons() {
// 	document.getElementById('submitbtn').addEventListener('click', postRequirements);
}

function dropDown(sat){
	var selectobject = document.getElementById("sat_req")

	for(i=0;i<sat.length;i++){
		const opt = document.createElement("option");
		opt.value = sat[i][1];
		opt.text = sat[i][1];
		selectobject.add(opt, null);
	} 
	console.log(selectobject)
}
function getSaturdayReq(){
	(async () => {
		  const rawResponse = await fetch('http://localhost:8080/getSaturdayRequirements', {
			  method: 'GET',
			  headers: {
				  'Accept': 'application/json',
				  'Content-Type': 'application/json'
			  },
		  });
		  const sat = await rawResponse.json();
		  console.log(sat)
		  info(sat);
		  dropDown(sat);
	  })();
}
function info(sat){
	tablebody = document.getElementById('tbody_6');
	for(i=sat.length-1;i>=0;i--){
		var row = tablebody.insertRow(0);
		var cell1 = row.insertCell(0);
		cell1.innerHTML = sat[i][5];
		var cell2 = row.insertCell(0);
		cell2.innerHTML = sat[i][4];
		var cell3 = row.insertCell(0);
		cell3.innerHTML = sat[i][3];
		var cell4 = row.insertCell(0);
		cell4.innerHTML = sat[i][2];
		var cell5 = row.insertCell(0);
		cell5.innerHTML = sat[i][1];
	}
	initButtons();
}

function submit(){
				console.log("YAY");
				dateVar = document.getElementById("sat_req").value;
				a1=document.getElementById("poolalevel1").value;
				a2=document.getElementById("poolalevel2").value;
				b1=document.getElementById("poolblevel1").value;
				b2=document.getElementById("poolblevel2").value;
			(async () => {
				console.log("dakhalt el async");
					const rawResponse = await fetch('http://localhost:8080/savesat', {
						method: 'POST',
						headers: {
							'Accept': 'application/json',
							'Content-Type': 'application/json'
						},
						body: JSON.stringify({"date":dateVar, "pool_a_level_1":a1,"pool_a_level_2":a2,"pool_b_level_1":b1,"pool_b_level_2":b2})
					});
				})();
				window.alert("The requirements have been updated successfully!")
}

	// 	document.getElementById('form').addEventListener('submit', function(){
	// 		console.log("YAY");
	// 		(async () => {
	// 			console.log("dakhalt el async");
	// 				const rawResponse = await fetch('http://localhost:8080/savesat', {
	// 					method: 'POST',
	// 					headers: {
	// 						'Accept': 'application/json',
	// 						'Content-Type': 'application/json'
	// 					},
	// 					body: JSON.stringify({"date":"1/7/2023", "pool_a_level_1":100,"pool_a_level_2":100,"pool_b_level_1":100,"pool_b_level_2":100})
	// 				});
	// 				const status_ = await rawResponse.json();
	// 				console.log(status_['status']);
					
	// 				if (status_['status'] == "OK") {
	// 					console.log("Script FINE");
	// 				}else{
	// 					console.log("Script NOT OK");
	// 				}
	// 				console.log("hakhrog men el async");
	// 			})();
	// })

function initButtons() {
	document.getElementById('updateBtn').addEventListener('click', submit);
	}


// initButtons();
getUsers();
getData();
getSaturdayReq();
