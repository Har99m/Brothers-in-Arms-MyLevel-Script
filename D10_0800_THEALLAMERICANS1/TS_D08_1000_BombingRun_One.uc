//=============================================================================
// TS_D08_1000_BombingRun_One.
//=============================================================================
class TS_D08_1000_BombingRun_One extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:
			//===== Explosions start going off like crazy


			ACTION_TriggerEvent('Emitter_Bombers_A');			
			
			ACTION_PlayLocalSound("M_CROSSROADS.DISTANTFLYBY");
				sleep(10.0);

			ACTION_PlayLocalSound("M_CROSSROADS.DISTANTFLYBY");
	

				sleep(8.0);
			
					ResetAbsoluteTime();
					StartAbsoluteTime();

				WaitForAbsoluteTime( 7.3 );
				//1
				ACTION_TriggerEvent( 'Emitter_BombingRun_01' );

				WaitForAbsoluteTime( 10.2 );
				//2
				ACTION_TriggerEvent( 'Emitter_BombingRun_02' );

					WaitForAbsoluteTime(10.3);
					//1a
					ACTION_TriggerEvent( 'gbxExplosionTrigger_Explosion_01' );

					WaitForAbsoluteTime(13.2);
					//2a
					ACTION_TriggerEvent( 'gbxExplosionTrigger_Explosion_02' );

				WaitForAbsoluteTime( 14.6 );
				//3
				ACTION_TriggerEvent( 'Emitter_BombingRun_03' );

					WaitForAbsoluteTime(17.6);
					//3a
					ACTION_TriggerEvent( 'gbxExplosionTrigger_Explosion_03' );
					ACTION_TriggerEvent('Mover01');
					ACTION_TriggerEvent('Emitter_OpelFall');

				WaitForAbsoluteTime( 17.1 );
				//4
				ACTION_TriggerEvent( 'Emitter_BombingRun_04' );

					WaitForAbsoluteTime(20.1);
					//4a
					ACTION_TriggerEvent( 'gbxExplosionTrigger_Explosion_04' );

				WaitForAbsoluteTime( 19.3 );
				//5
				ACTION_TriggerEvent( 'Emitter_BombingRun_05' );

					WaitForAbsoluteTime(22.3);
					//5a	
					ACTION_TriggerEvent( 'gbxExplosionTrigger_Explosion_05' );

	ACTION_WaitForEvent('TrigVol_End');

			GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_MAIN')).bEnabled = FALSE;
			GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_Panzerfaust_Crate02')).bEnabled = FALSE;
			ACTION_TriggerEvent('gbxWaypointBeacon_END');

			ACTION_DisplayObjective( 0, 'ObjectiveList', 4 );

			ACTION_TriggerEvent('Emitter_Bombers_B');
			ACTION_PlayLocalSound("M_CROSSROADS.DISTANTFLYBY");
			ACTION_PlayLocalSound("M_DARKNESS.BIGPLANE_C");
	
			}
