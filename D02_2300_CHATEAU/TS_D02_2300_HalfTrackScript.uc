//=============================================================================
// TS_D02_2300_HalfTrackScript.
//=============================================================================
class TS_D02_2300_HalfTrackScript extends TriggeredScript
	placeable;

var gbxSVehicle MyVehicle;
var array<name> VehiclePathOneTags;
var array<name> VehiclePathTwoTags;

function Timer()
{
	// make the gunner hard to kill...

}

state Default
	{
	Begin:
	
	SetTimer(1.0, true);

	}

state Triggered
	{
	Begin:

	ACTION_TriggerEvent('CSG_HalfTrackCrew');
	ACTION_TriggerEvent('HalftrackSpawner_HT01');
		sleep(0.2);

	Pawn(GetFirstActor('HalftrackGunner')).Health = 100;

	VehiclePathOneTags[0]='PathNodeA';  // node 1
	VehiclePathOneTags[1]='PathNodeB';  // node 2
	VehiclePathOneTags[2]='PathNodeC';  // node 3
	VehiclePathOneTags[3]='PathNodeD';  // node 4
	VehiclePathOneTags[4]='PathNodeE';  // node 5
	VehiclePathOneTags[5]='PathNodeF';  // node 6
	VehiclePathOneTags[6]='PathNodeG';  // node 7
	VehiclePathOneTags[7]='PathNodeH';  // node 8
	VehiclePathOneTags[8]='PathNodeI';  // node 9
	VehiclePathOneTags[9]='PathNodeJ';  // node 10
	VehiclePathOneTags[10]='PathNodeK';  // node 11
	VehiclePathOneTags[11]='PathNodeL';
	VehiclePathOneTags[12]='PathNodeM';
	VehiclePathOneTags[13]='PathNodeN';
		sleep(0.5);
		SLog("DUBADUBA DUBALJ )(*U*())(@)(*)(*#$()()@*#()$ DUB " );
	VehiclePathOneTags[14]='PathNodeO';
	VehiclePathOneTags[15]='PathNodeP';
	VehiclePathOneTags[16]='PathNodeQ';
	VehiclePathOneTags[17]='PathNodeR';
	VehiclePathOneTags[18]='PathNodeS';

	//VehiclePathOneTags[19]='PathNodeT';
	//VehiclePathOneTags[20]='PathNodeU';
	/*
	VehiclePathOneTags[21]='PathNodeV';
	VehiclePathOneTags[22]='PathNodeW';
	VehiclePathOneTags[23]='PathNodeX';
	VehiclePathOneTags[24]='PathNodeY';
	VehiclePathOneTags[25]='PathNodeZ';
	VehiclePathOneTags[26]='PathNodeAA';
	VehiclePathOneTags[27]='PathNodeAB';
	VehiclePathOneTags[28]='PathNodeAC'; // FINAL DESTINATION
	*/
		sleep(1.0);

	VehiclePathTwoTags[28]='PathNodeAC';
	VehiclePathTwoTags[27]='PathNodeAB';
	VehiclePathTwoTags[26]='PathNodeAA';
	VehiclePathTwoTags[25]='PathNodeZ';
	VehiclePathTwoTags[24]='PathNodeY';
	VehiclePathTwoTags[23]='PathNodeX';
	VehiclePathTwoTags[22]='PathNodeW';
	VehiclePathTwoTags[21]='PathNodeV';
	VehiclePathTwoTags[20]='PathNodeU';
	VehiclePathTwoTags[19]='PathNodeT';
	VehiclePathTwoTags[18]='PathNodeS';
	VehiclePathTwoTags[17]='PathNodeR';
	VehiclePathTwoTags[16]='PathNodeQ';
	VehiclePathTwoTags[15]='PathNodeP';
		sleep(0.5);
	VehiclePathTwoTags[14]='PathNodeO';
	VehiclePathTwoTags[13]='PathNodeN';
	VehiclePathTwoTags[12]='PathNodeM';
	VehiclePathTwoTags[11]='PathNodeL';
	VehiclePathTwoTags[10]='PathNodeK';
	VehiclePathTwoTags[9]='PathNodeJ';
	VehiclePathTwoTags[8]='PathNodeI';
	VehiclePathTwoTags[7]='PathNodeH';
	VehiclePathTwoTags[6]='PathNodeG';
	VehiclePathTwoTags[5]='PathNodeF';
	VehiclePathTwoTags[4]='PathNodeE';
	VehiclePathTwoTags[3]='PathNodeD';
	VehiclePathTwoTags[2]='PathNodeC';
	VehiclePathTwoTags[1]='PathNodeB';
	VehiclePathTwoTags[0]='PathNodeA'; // FINAL DESTINATION

	MyVehicle = gbxSVehicle(GetFirstActor('GetOutOfTheHalfTrack'));

//Loop:

	Halftrack(MyVehicle).MaxThrust = 42.0;


	/*
	ACTION_VehicleFollowPath( MyVehicle, VehiclePathOneTags );

	while ( !VehicleIsAtDestination(MyVehicle) )
	{
		sleep(0.1);
	}

	Log("Vehicle has reached destination One, now do the second half!");
	

		sleep(3.0);
	ACTION_TriggerEvent('GetOutOfTheHalfTrack');
		sleep(2.0);
	ACTION_TriggerEvent('GetOutOfTheHalfTrack');
	*/


	/*
	ACTION_VehicleFollowPath( MyVehicle, VehiclePathTwoTags );

	while ( !VehicleIsAtDestination(MyVehicle) )
	{
		sleep(0.1);
	}

	Log("Vehicle has reached destination Two, now do the first half!");
	*/

//	GotoState('Triggered', 'Loop');
}
