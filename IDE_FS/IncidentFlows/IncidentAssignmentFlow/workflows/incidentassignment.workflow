{
	"contents": {
		"1c807bed-67d2-4b98-9734-6b299b4effea": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "P005676incidentassignment",
			"subject": "incidentassignment",
			"name": "P005676incidentassignment",
			"lastIds": "25b02ebb-9bab-4172-ab7e-cf0e211160ca",
			"events": {
				"5979dbc7-4fdc-495d-a317-b74e32cd91e4": {
					"name": "StartEvent1"
				},
				"9df45d29-70ac-455f-a47d-0a1c0aa04435": {
					"name": "Flow complete"
				},
				"38220247-4572-45a2-ad52-729a3030cfd7": {
					"name": "No flow required"
				}
			},
			"activities": {
				"834d0cd9-db24-4b80-b605-58a3f3d62f69": {
					"name": "Retrieve Incident Details"
				},
				"a95079dc-1649-44dc-986d-07e1a4d6aad4": {
					"name": "Determine Relevant Processor"
				},
				"3d270025-d758-4c52-ba7b-41bbcc86f351": {
					"name": "Prepare Incident Update"
				},
				"acc34b79-518a-4f71-b125-95f9844b15f1": {
					"name": "Update Incident"
				},
				"00d1221f-778c-4791-874a-b589a2f275d8": {
					"name": "Retrieve Individuals"
				},
				"2cc743c7-9ef1-4b55-8bf8-fad4b493a0d4": {
					"name": "Assign Relevant Processor"
				},
				"c945f7e7-b579-4a7c-a1da-4044751d3728": {
					"name": "Incident Status Check"
				},
				"e49fb3c0-7609-4aca-a1d5-20915a8b6bc1": {
					"name": "Retrieve Photo Data"
				},
				"2e577527-f9a2-43ae-9569-1db20fd306b9": {
					"name": "New Safety Incident"
				}
			},
			"sequenceFlows": {
				"5184f0c1-a1e8-49a8-8685-7f33b6ca1a63": {
					"name": "SequenceFlow1"
				},
				"5cd2e00b-ccaa-4ae8-b020-30339bc60353": {
					"name": "SequenceFlow2"
				},
				"fbfb9134-a4f2-4b53-8cea-834de49b805d": {
					"name": "SequenceFlow4"
				},
				"5eda02e4-4274-44b6-962f-017bf667df1d": {
					"name": "SequenceFlow5"
				},
				"dfcaed67-a33e-41be-9718-fb9d32e9cda8": {
					"name": "SequenceFlow6"
				},
				"808bec2f-845b-4825-be67-50cb11c66105": {
					"name": "SequenceFlow7"
				},
				"0fc4834c-65ff-4234-80a0-8692f3165569": {
					"name": "SequenceFlow9"
				},
				"f8fc4198-b79d-4cb8-821b-dfb66de022b8": {
					"name": "Incident is new"
				},
				"6ecbdb35-85c8-4fa0-a506-61f15e524e3c": {
					"name": "Incident already in progress"
				},
				"bc3a3398-6744-426c-b3d2-d0f385714248": {
					"name": "SequenceFlow12"
				},
				"32f1b24e-8a18-4c16-8e50-fff69e41177b": {
					"name": "SequenceFlow14"
				}
			},
			"diagrams": {
				"e6f05ebf-65a5-4421-8b90-ead9603645a1": {}
			}
		},
		"5979dbc7-4fdc-495d-a317-b74e32cd91e4": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"fedea705-b5cc-4c66-ba6c-7d6936c5f4aa": {}
			}
		},
		"9df45d29-70ac-455f-a47d-0a1c0aa04435": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "Flow complete"
		},
		"38220247-4572-45a2-ad52-729a3030cfd7": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "No flow required"
		},
		"834d0cd9-db24-4b80-b605-58a3f3d62f69": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Incidents_CF",
			"path": "/incident/SafetyIncidents(${context.incidentID})",
			"httpMethod": "GET",
			"responseVariable": "${context.incident}",
			"id": "servicetask1",
			"name": "Retrieve Incident Details",
			"documentation": "OData READ of specific incident from CAP service"
		},
		"a95079dc-1649-44dc-986d-07e1a4d6aad4": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/incidentassignment/assignuser.js",
			"id": "scripttask1",
			"name": "Determine Relevant Processor",
			"documentation": "Determine the assignee and get their ID from the individuals data already retrieved."
		},
		"3d270025-d758-4c52-ba7b-41bbcc86f351": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/incidentassignment/marshalupdate.js",
			"id": "scripttask2",
			"name": "Prepare Incident Update",
			"documentation": "Prepare an update to the incident, either setting it to Resolved or Closed."
		},
		"acc34b79-518a-4f71-b125-95f9844b15f1": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Incidents_CF",
			"path": "/incident/SafetyIncidents(${context.incident.ID})",
			"httpMethod": "PUT",
			"requestVariable": "${context.incidentUpdateRequest}",
			"responseVariable": "${context.incidentUpdateResponse}",
			"id": "servicetask2",
			"name": "Update Incident",
			"documentation": "Update incident with the appropriate status and comment added to the incident description."
		},
		"00d1221f-778c-4791-874a-b589a2f275d8": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Incidents_CF",
			"path": "/incident/Individual",
			"httpMethod": "GET",
			"responseVariable": "${context.individuals}",
			"id": "servicetask3",
			"name": "Retrieve Individuals",
			"documentation": "OData query of Individual entityset (details of each potential assignee)"
		},
		"2cc743c7-9ef1-4b55-8bf8-fad4b493a0d4": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Incidents_CF",
			"path": "/incident/SafetyIncidents(${context.incident.ID})",
			"httpMethod": "PUT",
			"requestVariable": "${context.assignmentpayload}",
			"id": "servicetask4",
			"name": "Assign Relevant Processor",
			"documentation": "OData update on the incident to set the assignee and status."
		},
		"c945f7e7-b579-4a7c-a1da-4044751d3728": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Incident Status Check",
			"default": "6ecbdb35-85c8-4fa0-a506-61f15e524e3c"
		},
		"e49fb3c0-7609-4aca-a1d5-20915a8b6bc1": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Incidents_CF",
			"path": "/incident/SafetyIncidents(${context.incidentID})/incidentPhotos",
			"httpMethod": "GET",
			"responseVariable": "${context.incidentPhotos}",
			"id": "servicetask5",
			"name": "Retrieve Photo Data",
			"documentation": "OData READ of specific incidentPhotos nav path from incident"
		},
		"2e577527-f9a2-43ae-9569-1db20fd306b9": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "${context.incident.title}",
			"description": "Please action as appropriate.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "P005676",
			"formReference": "/forms/incidentassignment/IncidentForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "incidentform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask3",
			"name": "New Safety Incident",
			"documentation": "User task to get the assignee to work on the incident. Task will either be Confirmed(incident valid, and resolved)"
		},
		"5184f0c1-a1e8-49a8-8685-7f33b6ca1a63": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "5979dbc7-4fdc-495d-a317-b74e32cd91e4",
			"targetRef": "834d0cd9-db24-4b80-b605-58a3f3d62f69"
		},
		"5cd2e00b-ccaa-4ae8-b020-30339bc60353": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "834d0cd9-db24-4b80-b605-58a3f3d62f69",
			"targetRef": "c945f7e7-b579-4a7c-a1da-4044751d3728"
		},
		"fbfb9134-a4f2-4b53-8cea-834de49b805d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "a95079dc-1649-44dc-986d-07e1a4d6aad4",
			"targetRef": "2cc743c7-9ef1-4b55-8bf8-fad4b493a0d4"
		},
		"5eda02e4-4274-44b6-962f-017bf667df1d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "3d270025-d758-4c52-ba7b-41bbcc86f351",
			"targetRef": "acc34b79-518a-4f71-b125-95f9844b15f1"
		},
		"dfcaed67-a33e-41be-9718-fb9d32e9cda8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "acc34b79-518a-4f71-b125-95f9844b15f1",
			"targetRef": "9df45d29-70ac-455f-a47d-0a1c0aa04435"
		},
		"808bec2f-845b-4825-be67-50cb11c66105": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "00d1221f-778c-4791-874a-b589a2f275d8",
			"targetRef": "a95079dc-1649-44dc-986d-07e1a4d6aad4"
		},
		"0fc4834c-65ff-4234-80a0-8692f3165569": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "2cc743c7-9ef1-4b55-8bf8-fad4b493a0d4",
			"targetRef": "e49fb3c0-7609-4aca-a1d5-20915a8b6bc1"
		},
		"f8fc4198-b79d-4cb8-821b-dfb66de022b8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.incident.incidentStatus_code == \"new\"}",
			"id": "sequenceflow10",
			"name": "Incident is new",
			"sourceRef": "c945f7e7-b579-4a7c-a1da-4044751d3728",
			"targetRef": "00d1221f-778c-4791-874a-b589a2f275d8"
		},
		"6ecbdb35-85c8-4fa0-a506-61f15e524e3c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "Incident already in progress",
			"sourceRef": "c945f7e7-b579-4a7c-a1da-4044751d3728",
			"targetRef": "38220247-4572-45a2-ad52-729a3030cfd7"
		},
		"bc3a3398-6744-426c-b3d2-d0f385714248": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "e49fb3c0-7609-4aca-a1d5-20915a8b6bc1",
			"targetRef": "2e577527-f9a2-43ae-9569-1db20fd306b9"
		},
		"32f1b24e-8a18-4c16-8e50-fff69e41177b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "SequenceFlow14",
			"sourceRef": "2e577527-f9a2-43ae-9569-1db20fd306b9",
			"targetRef": "3d270025-d758-4c52-ba7b-41bbcc86f351"
		},
		"e6f05ebf-65a5-4421-8b90-ead9603645a1": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"2531ef46-2c86-4512-8381-331cfd783223": {},
				"1bb31f63-3aaa-4adc-b46a-084df55bc64b": {},
				"8df0dc01-da3a-42d1-88f6-d3c951ad29dc": {},
				"cd2acbd6-a0f0-45f0-aef9-fcf1d35ff605": {},
				"c571ee40-4873-4771-aa30-19dcf0b8d2a8": {},
				"2bc8eaf9-1ed7-4ab4-bb4f-4f03277a30b7": {},
				"9b8342a3-7c8c-43cf-bfcd-e79e5b2e41f6": {},
				"86a14e1f-8a35-45c9-ae7e-5d723733bd85": {},
				"64182b25-3e64-405d-8b42-1b866f61303f": {},
				"f3649f00-0ac3-439b-8892-4088afe21b63": {},
				"71ab8df5-328e-4d07-99b2-e17b981820a1": {},
				"cddf42f8-80e1-4312-b093-c63f2166f3cc": {},
				"2c627cb0-dcef-428e-a066-171304f483ec": {},
				"e5cffd88-189b-49b3-a340-9a7126c07d27": {},
				"99d7855a-d1ef-4094-9db8-f565ca5e308e": {},
				"923d1402-bc9c-4778-8f6d-6866e0f6e00c": {},
				"a73113cf-878d-4f2f-bb0d-2d8cc78383fb": {},
				"2a3d8a48-0527-4d00-9580-6a706871935a": {},
				"0cc99333-5bf4-4cdf-ad4d-1bb535f87f27": {},
				"21c305c3-1bee-4979-a5e9-56a0ed62f54f": {},
				"3f7c9e24-6417-4ea1-8696-0b2cbf976115": {},
				"0bdf4714-80bc-445b-87a9-8aebe860abec": {},
				"ba11a987-f6a5-44e9-a1c7-82c313b90f68": {}
			}
		},
		"fedea705-b5cc-4c66-ba6c-7d6936c5f4aa": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/incidentassignment/sample.json",
			"id": "default-start-context"
		},
		"2531ef46-2c86-4512-8381-331cfd783223": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 88.5,
			"y": 12,
			"width": 32,
			"height": 32,
			"object": "5979dbc7-4fdc-495d-a317-b74e32cd91e4"
		},
		"1bb31f63-3aaa-4adc-b46a-084df55bc64b": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 87,
			"y": 1105.9999976158142,
			"width": 35,
			"height": 35,
			"object": "9df45d29-70ac-455f-a47d-0a1c0aa04435"
		},
		"8df0dc01-da3a-42d1-88f6-d3c951ad29dc": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.5,44 104.5,94",
			"sourceSymbol": "2531ef46-2c86-4512-8381-331cfd783223",
			"targetSymbol": "cd2acbd6-a0f0-45f0-aef9-fcf1d35ff605",
			"object": "5184f0c1-a1e8-49a8-8685-7f33b6ca1a63"
		},
		"cd2acbd6-a0f0-45f0-aef9-fcf1d35ff605": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 54.5,
			"y": 94,
			"width": 100,
			"height": 60,
			"object": "834d0cd9-db24-4b80-b605-58a3f3d62f69"
		},
		"c571ee40-4873-4771-aa30-19dcf0b8d2a8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.5,154 104.5,204",
			"sourceSymbol": "cd2acbd6-a0f0-45f0-aef9-fcf1d35ff605",
			"targetSymbol": "923d1402-bc9c-4778-8f6d-6866e0f6e00c",
			"object": "5cd2e00b-ccaa-4ae8-b020-30339bc60353"
		},
		"2bc8eaf9-1ed7-4ab4-bb4f-4f03277a30b7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 54.5,
			"y": 460.9999976158142,
			"width": 100,
			"height": 60,
			"object": "a95079dc-1649-44dc-986d-07e1a4d6aad4"
		},
		"9b8342a3-7c8c-43cf-bfcd-e79e5b2e41f6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.5,520.9999976158142 104.5,555.9999976158142",
			"sourceSymbol": "2bc8eaf9-1ed7-4ab4-bb4f-4f03277a30b7",
			"targetSymbol": "e5cffd88-189b-49b3-a340-9a7126c07d27",
			"object": "fbfb9134-a4f2-4b53-8cea-834de49b805d"
		},
		"86a14e1f-8a35-45c9-ae7e-5d723733bd85": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 54.5,
			"y": 885.9999976158142,
			"width": 100,
			"height": 60,
			"object": "3d270025-d758-4c52-ba7b-41bbcc86f351"
		},
		"64182b25-3e64-405d-8b42-1b866f61303f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.5,945.9999976158142 104.5,995.9999976158142",
			"sourceSymbol": "86a14e1f-8a35-45c9-ae7e-5d723733bd85",
			"targetSymbol": "f3649f00-0ac3-439b-8892-4088afe21b63",
			"object": "5eda02e4-4274-44b6-962f-017bf667df1d"
		},
		"f3649f00-0ac3-439b-8892-4088afe21b63": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 54.5,
			"y": 995.9999976158142,
			"width": 100,
			"height": 60,
			"object": "acc34b79-518a-4f71-b125-95f9844b15f1"
		},
		"71ab8df5-328e-4d07-99b2-e17b981820a1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.5,1055.9999976158142 104.5,1105.9999976158142",
			"sourceSymbol": "f3649f00-0ac3-439b-8892-4088afe21b63",
			"targetSymbol": "1bb31f63-3aaa-4adc-b46a-084df55bc64b",
			"object": "dfcaed67-a33e-41be-9718-fb9d32e9cda8"
		},
		"cddf42f8-80e1-4312-b093-c63f2166f3cc": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -97,
			"y": 345.9999988079071,
			"width": 100,
			"height": 60,
			"object": "00d1221f-778c-4791-874a-b589a2f275d8"
		},
		"2c627cb0-dcef-428e-a066-171304f483ec": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-47,405.9999988079071 -47,433.75 104.5,433.75 104.5,460.9999976158142",
			"sourceSymbol": "cddf42f8-80e1-4312-b093-c63f2166f3cc",
			"targetSymbol": "2bc8eaf9-1ed7-4ab4-bb4f-4f03277a30b7",
			"object": "808bec2f-845b-4825-be67-50cb11c66105"
		},
		"e5cffd88-189b-49b3-a340-9a7126c07d27": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 54.5,
			"y": 555.9999976158142,
			"width": 100,
			"height": 60,
			"object": "2cc743c7-9ef1-4b55-8bf8-fad4b493a0d4"
		},
		"99d7855a-d1ef-4094-9db8-f565ca5e308e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.5,615.9999976158142 104.5,665.9999976158142",
			"sourceSymbol": "e5cffd88-189b-49b3-a340-9a7126c07d27",
			"targetSymbol": "21c305c3-1bee-4979-a5e9-56a0ed62f54f",
			"object": "0fc4834c-65ff-4234-80a0-8692f3165569"
		},
		"923d1402-bc9c-4778-8f6d-6866e0f6e00c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 83.5,
			"y": 204,
			"object": "c945f7e7-b579-4a7c-a1da-4044751d3728"
		},
		"a73113cf-878d-4f2f-bb0d-2d8cc78383fb": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.5,246 104.5,296 -47,296 -47,345.9999988079071",
			"sourceSymbol": "923d1402-bc9c-4778-8f6d-6866e0f6e00c",
			"targetSymbol": "cddf42f8-80e1-4312-b093-c63f2166f3cc",
			"object": "f8fc4198-b79d-4cb8-821b-dfb66de022b8"
		},
		"2a3d8a48-0527-4d00-9580-6a706871935a": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 339,
			"y": 328.9999988079071,
			"width": 35,
			"height": 35,
			"object": "38220247-4572-45a2-ad52-729a3030cfd7"
		},
		"0cc99333-5bf4-4cdf-ad4d-1bb535f87f27": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.5,246 104.5,286 356.5,286 356.5,328.9999988079071",
			"sourceSymbol": "923d1402-bc9c-4778-8f6d-6866e0f6e00c",
			"targetSymbol": "2a3d8a48-0527-4d00-9580-6a706871935a",
			"object": "6ecbdb35-85c8-4fa0-a506-61f15e524e3c"
		},
		"21c305c3-1bee-4979-a5e9-56a0ed62f54f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 54.5,
			"y": 665.9999976158142,
			"width": 100,
			"height": 60,
			"object": "e49fb3c0-7609-4aca-a1d5-20915a8b6bc1"
		},
		"3f7c9e24-6417-4ea1-8696-0b2cbf976115": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.75,695.9999976158142 104.75,807",
			"sourceSymbol": "21c305c3-1bee-4979-a5e9-56a0ed62f54f",
			"targetSymbol": "0bdf4714-80bc-445b-87a9-8aebe860abec",
			"object": "bc3a3398-6744-426c-b3d2-d0f385714248"
		},
		"0bdf4714-80bc-445b-87a9-8aebe860abec": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 55,
			"y": 777,
			"width": 100,
			"height": 60,
			"object": "2e577527-f9a2-43ae-9569-1db20fd306b9"
		},
		"ba11a987-f6a5-44e9-a1c7-82c313b90f68": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "104.75,807 104.75,915.9999976158142",
			"sourceSymbol": "0bdf4714-80bc-445b-87a9-8aebe860abec",
			"targetSymbol": "86a14e1f-8a35-45c9-ae7e-5d723733bd85",
			"object": "32f1b24e-8a18-4c16-8e50-fff69e41177b"
		},
		"25b02ebb-9bab-4172-ab7e-cf0e211160ca": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 1,
			"sequenceflow": 14,
			"startevent": 1,
			"endevent": 2,
			"usertask": 3,
			"servicetask": 5,
			"scripttask": 3,
			"exclusivegateway": 1
		}
	}
}