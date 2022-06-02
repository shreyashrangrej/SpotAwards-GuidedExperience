{
	"contents": {
		"01fcd138-adc1-405c-b9d9-f0003eb3ac0e": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "SpotAward",
			"subject": "SpotAward",
			"businessKey": "${context.wfRequestId}",
			"name": "SpotAward",
			"documentation": "",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent"
				},
				"f3579267-6282-4935-a583-f08fcc25bdaa": {
					"name": "wait to complete"
				}
			},
			"activities": {
				"21605277-a793-44b6-be49-eec9610c27f2": {
					"name": "getWorkflowPendingData"
				},
				"00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1": {
					"name": "workflowDetail"
				},
				"c27ae2e3-02af-4950-b9a8-1762a6f46145": {
					"name": "getWorkflowStatus"
				},
				"2a4b26d7-43d5-4ff6-be74-fa1f754ba3e4": {
					"name": "workflow completed"
				},
				"57fd8161-efbe-4bba-b980-3b2e8ba2f51b": {
					"name": "approveService"
				},
				"3f373900-92dd-4c05-a625-4198e003bbc3": {
					"name": "getWorkflowStepStatus"
				},
				"309d64ba-4fd9-4d8d-8730-70d8f23af7bb": {
					"name": "step pending"
				},
				"182dfc21-f60d-4fa0-bc43-4ff1c2e9f045": {
					"name": "getApproverType"
				},
				"26131cb1-fbce-4f48-82c1-9e3091766ce8": {
					"name": "preparePendingData"
				},
				"587b17ae-cdbe-4422-89eb-6ef0d01d40e9": {
					"name": "cleanComment"
				},
				"10c6cabe-d084-4e8b-9674-14146adfb64d": {
					"name": "extractAction"
				},
				"fa5018f7-c432-469c-97bb-e635990223c0": {
					"name": "which action"
				},
				"1cac9a60-297a-4a31-ba1a-32682f791b9f": {
					"name": "declineService"
				},
				"2beb1c40-f819-4231-affc-bf28f7d2d784": {
					"name": "refineWorkflowStatus"
				},
				"fa762b08-45e3-45fe-aa44-49b539055705": {
					"name": "which type of approver"
				},
				"cbc04df6-d8b4-496e-ab86-6b28bf5aff01": {
					"name": "refineApproverType"
				},
				"1e1e6548-5819-4e8d-9c9d-ecb7e18b7618": {
					"name": "getApproverByPosition"
				},
				"d32bd25c-a1e2-4d39-8970-eda8b0344c8b": {
					"name": "extractApproverByRole"
				},
				"722b7aaa-300d-43d0-ae81-d7c19c891223": {
					"name": "extractApproverByPosition"
				},
				"342ea8e7-b2fa-4c14-8b18-8f9abb933e29": {
					"name": "getDynamicGroupId"
				},
				"86cfe75a-c589-4314-99ca-b39b5fab9ec1": {
					"name": "extractApproverByDynamicGroup"
				},
				"3003d201-e6c8-4a28-9d09-ee46414e7b4c": {
					"name": "getUserByDynamicGroup"
				},
				"4084f337-384e-47eb-9e66-7e6442325fd6": {
					"name": "extractDynamicGroupId"
				},
				"d714def5-92d9-4a81-9f78-ec999f265675": {
					"name": "getWorkflowUserDetail"
				},
				"f19a1e3c-c1ee-4cee-b2a5-79ab1ee2427e": {
					"name": "getDynamicGroupUsername"
				},
				"17e96ea2-e0a8-4884-8c06-96d2e2b0760e": {
					"name": "extractUserFromDynamicGroup"
				}
			},
			"sequenceFlows": {
				"65d2cba0-784b-464e-9e61-8eea4bc3e678": {
					"name": "SequenceFlow3"
				},
				"a03855e5-b2bf-4b5d-b2ed-9034d562244b": {
					"name": "yes"
				},
				"a17bec2c-5231-41b1-b136-68b2199983ac": {
					"name": "no"
				},
				"de193bb1-9930-4724-b988-a78faa10783e": {
					"name": "SequenceFlow10"
				},
				"4c0c04d2-798a-4b6e-b292-66c6c5ccbb2e": {
					"name": "SequenceFlow11"
				},
				"ab43c7df-73f5-470f-aa3c-452fee22d695": {
					"name": "SequenceFlow14"
				},
				"a1ecd4d2-ed31-4fac-9c0f-84052fe7441f": {
					"name": "SequenceFlow15"
				},
				"c82c8f3f-9e94-4f50-951e-f7fe00844262": {
					"name": "yes"
				},
				"6d77666c-f26f-4e70-9867-7e3691346f02": {
					"name": "SequenceFlow17"
				},
				"d7694961-10e1-4bb6-b4ac-fb28d4f3f517": {
					"name": "no"
				},
				"75033dd5-55f9-4f92-b669-551f37e4e19c": {
					"name": "SequenceFlow21"
				},
				"4e68bb97-f93b-4e4d-85cb-859f9b578761": {
					"name": "SequenceFlow22"
				},
				"8b9166df-cbd9-4e97-bc7f-ebc4c304676c": {
					"name": "SequenceFlow25"
				},
				"83c7052b-0a67-409e-984c-ed68905eec1c": {
					"name": "SequenceFlow26"
				},
				"ea99384c-44f5-48e9-aa6b-524dce2d88cf": {
					"name": "decline"
				},
				"2a2e5069-1faa-44b1-9410-4a125bc1369d": {
					"name": "approve"
				},
				"8115d2b8-38d5-4546-bf25-afd1ec94f1c2": {
					"name": "SequenceFlow32"
				},
				"96eade96-8c7e-4404-9438-cb0f54c5ffed": {
					"name": "SequenceFlow33"
				},
				"60db7826-f3de-40b2-bf1e-185dc6eb1f09": {
					"name": "SequenceFlow34"
				},
				"42e25d1f-5825-4805-b7fc-3f52ec544b95": {
					"name": "SequenceFlow36"
				},
				"101a735b-08e2-4886-b4e8-a1f9d705033d": {
					"name": "person"
				},
				"4953eaef-537e-418a-aa1a-fb169a68af42": {
					"name": "SequenceFlow39"
				},
				"d40137c0-cb47-4202-898b-12572542a209": {
					"name": "SequenceFlow40"
				},
				"7fbdd228-acf6-4dfa-9ae8-59fda53d9f05": {
					"name": "position"
				},
				"0b8e0df4-47ab-4589-977c-454e25fd0676": {
					"name": "dynamicGroup"
				},
				"eb34f897-47c3-41ee-b42e-b0443529983c": {
					"name": "SequenceFlow45"
				},
				"aee9191d-b2f0-44d5-9669-78159e2a4f19": {
					"name": "SequenceFlow46"
				},
				"5ebf5378-ce18-40e7-84b3-e24e69da72cf": {
					"name": "SequenceFlow47"
				},
				"87a587e0-5cf5-4de9-8cd4-469c4a3b2502": {
					"name": "SequenceFlow49"
				},
				"05faebc4-4a5a-4a57-bc44-101158a4935d": {
					"name": "SequenceFlow50"
				},
				"5518d3bc-49fe-4191-9e06-e428d4c79308": {
					"name": "SequenceFlow51"
				},
				"07a2953f-7b81-462c-9c73-90f6112a827f": {
					"name": "SequenceFlow52"
				},
				"f77796f9-89fc-4426-a0a1-712a1f05c182": {
					"name": "SequenceFlow53"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent",
			"sampleContextRefs": {
				"1332f469-ea63-4934-83f4-063e3b00cf30": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent"
		},
		"f3579267-6282-4935-a583-f08fcc25bdaa": {
			"classDefinition": "com.sap.bpm.wfs.BoundaryEvent",
			"isCanceling": true,
			"id": "boundarytimerevent1",
			"name": "wait to complete",
			"attachedToRef": "00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1",
			"eventDefinitions": {
				"ebd2a95b-440b-415e-8411-3a1b50bea328": {}
			}
		},
		"21605277-a793-44b6-be49-eec9610c27f2": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odatav4/SpotAwardService.svc/SpotAward?$format=json&$expand=categoryNav($select=title),levelNav($select=title),spotAwardProgramNav($select=displayedProgramName)&$select=awardAmount,guidelineAmount,commentForReceiver,currency,commentForApprovers,approvedDate,spotAwardProgram,createdDateTime,lastModifiedDateTime,approvalStatus&$filter= recordId eq '${context. recordId}'",
			"httpMethod": "GET",
			"responseVariable": "${context.workflowPendingData}",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.nominatorId}"
			}],
			"id": "servicetask1",
			"name": "getWorkflowPendingData",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Post comments or Withdraw request",
			"description": "",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.approver}",
			"formReference": "/forms/SpotAward/fill.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "fill"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "workflowDetail"
		},
		"c27ae2e3-02af-4950-b9a8-1762a6f46145": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odata/v2/WfRequest?$format=json&$select=status,currentStepNum,empWfRequestNav/wfConfig&$expand=empWfRequestNav/wfConfigNav/wfStepApproverNav/approverGroupNav&$filter=wfRequestId eq ${context.wfRequestId}",
			"httpMethod": "GET",
			"responseVariable": "${context.workflowStatus}",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.nominatorId}"
			}],
			"id": "servicetask2",
			"name": "getWorkflowStatus",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"2a4b26d7-43d5-4ff6-be74-fa1f754ba3e4": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "workflow completed",
			"default": "a03855e5-b2bf-4b5d-b2ed-9034d562244b"
		},
		"57fd8161-efbe-4bba-b980-3b2e8ba2f51b": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odata/v2/approveWfRequest?$format=json&comment='${context.comment}'&wfRequestId=${context.wfRequestId}L",
			"httpMethod": "POST",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.processor}"
			}],
			"id": "servicetask3",
			"name": "approveService",
			"principalPropagationRef": "00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1"
		},
		"3f373900-92dd-4c05-a625-4198e003bbc3": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odata/v2/WfRequestStep?$format=json&$select=wfRequestId,stepNum,status&$filter=wfRequestId eq ${context.wfRequestId} and stepNum eq ${context.workflowStatus.currentStepNum}",
			"httpMethod": "GET",
			"responseVariable": "${context.stepStatus}",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.processor}"
			}],
			"id": "servicetask5",
			"name": "getWorkflowStepStatus",
			"principalPropagationRef": "00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1"
		},
		"309d64ba-4fd9-4d8d-8730-70d8f23af7bb": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway3",
			"name": "step pending",
			"default": "d7694961-10e1-4bb6-b4ac-fb28d4f3f517"
		},
		"182dfc21-f60d-4fa0-bc43-4ff1c2e9f045": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odata/v2/WfRequestStep?$format=json&$select=wfRequestId,stepNum,status,ownerNav/userId,ownerNav/username,approverType,positionNav/code,ownerNav/personKeyNav/userAccountNav/username&$expand=ownerNav/personKeyNav/userAccountNav,positionNav&$filter=stepNum eq ${context.workflowStatus.currentStepNum} and wfRequestId eq ${context.wfRequestId}",
			"httpMethod": "GET",
			"responseVariable": "${context.approverType}",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.nominatorId}"
			}],
			"id": "servicetask6",
			"name": "getApproverType",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"26131cb1-fbce-4f48-82c1-9e3091766ce8": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/preparePendingData.js",
			"id": "scripttask1",
			"name": "preparePendingData"
		},
		"587b17ae-cdbe-4422-89eb-6ef0d01d40e9": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/cleanComment.js",
			"id": "scripttask2",
			"name": "cleanComment"
		},
		"10c6cabe-d084-4e8b-9674-14146adfb64d": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/extractAction.js",
			"id": "scripttask3",
			"name": "extractAction"
		},
		"fa5018f7-c432-469c-97bb-e635990223c0": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway7",
			"name": "which action",
			"default": "2a2e5069-1faa-44b1-9410-4a125bc1369d"
		},
		"1cac9a60-297a-4a31-ba1a-32682f791b9f": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odata/v2/rejectWfRequest?$format=json&comment='${context.comment}'&wfRequestId=${context.wfRequestId}L",
			"httpMethod": "POST",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.processor}"
			}],
			"id": "servicetask7",
			"name": "declineService",
			"principalPropagationRef": "00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1"
		},
		"2beb1c40-f819-4231-affc-bf28f7d2d784": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/refineWorkflowStatus.js",
			"id": "scripttask4",
			"name": "refineWorkflowStatus"
		},
		"fa762b08-45e3-45fe-aa44-49b539055705": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway8",
			"name": "which type of approver",
			"default": "101a735b-08e2-4886-b4e8-a1f9d705033d"
		},
		"cbc04df6-d8b4-496e-ab86-6b28bf5aff01": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/refineApproverType.js",
			"id": "scripttask5",
			"name": "refineApproverType"
		},
		"1e1e6548-5819-4e8d-9c9d-ecb7e18b7618": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odata/v2/EmpJob?$format=json&$select=userId,userNav/personKeyNav/userAccountNav/username&$expand=userNav/personKeyNav/userAccountNav&$filter=positionNav/code eq ${context.approverType.positionNav.results[0].code}",
			"httpMethod": "GET",
			"responseVariable": "${context.jobInfo}",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.nominatorId}"
			}],
			"id": "servicetask8",
			"name": "getApproverByPosition",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"d32bd25c-a1e2-4d39-8970-eda8b0344c8b": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/extractApproverByRole.js",
			"id": "scripttask6",
			"name": "extractApproverByRole"
		},
		"722b7aaa-300d-43d0-ae81-d7c19c891223": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/extractApproverByPosition.js",
			"id": "scripttask7",
			"name": "extractApproverByPosition"
		},
		"342ea8e7-b2fa-4c14-8b18-8f9abb933e29": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odata/v2/FOWfConfigStepApprover?$format=json&$select=externalCode,stepNum,approverType,approverGroupNav/groupID&$expand=approverGroupNav&$filter=externalCode eq '${context.workflowStatus.wfConfig}' and stepNum eq ${context.workflowStatus.currentStepNum}L",
			"httpMethod": "GET",
			"responseVariable": "${context.dynamicGroup}",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.nominatorId}"
			}],
			"id": "servicetask9",
			"name": "getDynamicGroupId",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"86cfe75a-c589-4314-99ca-b39b5fab9ec1": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/extractApproverByDynamicGroup.js",
			"id": "scripttask8",
			"name": "extractApproverByDynamicGroup"
		},
		"3003d201-e6c8-4a28-9d09-ee46414e7b4c": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odata/v2/getUsersByDynamicGroup?$format=json&groupId=${context.dynamicGroup.dynamicGroupID}L",
			"httpMethod": "GET",
			"responseVariable": "${context.dynamicGroupUser}",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.nominatorId}"
			}],
			"id": "servicetask10",
			"name": "getUserByDynamicGroup",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"4084f337-384e-47eb-9e66-7e6442325fd6": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/extractDynamicGroupId.js",
			"id": "scripttask9",
			"name": "extractDynamicGroupId"
		},
		"d714def5-92d9-4a81-9f78-ec999f265675": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odatav4/SpotAwardService.svc/SpotAwardUserDetail?$format=json&$select=nomineeFullName,nominatorFullName,nominatorId&$filter=recordId eq '${context. recordId}'",
			"httpMethod": "GET",
			"responseVariable": "${context.workflowUserDetail}",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.nominatorId}"
			}],
			"id": "servicetask11",
			"name": "getWorkflowUserDetail",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"f19a1e3c-c1ee-4cee-b2a5-79ab1ee2427e": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SuccessFactors_API",
			"path": "/odata/v2/User?$format=json&$expand=personKeyNav/userAccountNav&$select=userId,personKeyNav/userAccountNav/username&$filter=userId in ${context.approverIds}",
			"httpMethod": "GET",
			"responseVariable": "${context.dynamicGroupUser}",
			"headers": [{
				"name": "successfactors-employment-id",
				"value": "${context.nominatorId}"
			}],
			"id": "servicetask12",
			"name": "getDynamicGroupUsername",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"17e96ea2-e0a8-4884-8c06-96d2e2b0760e": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SpotAward/extractUserFromDynamicGroup.js",
			"id": "scripttask10",
			"name": "extractUserFromDynamicGroup"
		},
		"65d2cba0-784b-464e-9e61-8eea4bc3e678": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1",
			"targetRef": "10c6cabe-d084-4e8b-9674-14146adfb64d"
		},
		"a03855e5-b2bf-4b5d-b2ed-9034d562244b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "yes",
			"sourceRef": "2a4b26d7-43d5-4ff6-be74-fa1f754ba3e4",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"a17bec2c-5231-41b1-b136-68b2199983ac": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.workflowStatus.status==\"PENDING\"}",
			"id": "sequenceflow7",
			"name": "no",
			"sourceRef": "2a4b26d7-43d5-4ff6-be74-fa1f754ba3e4",
			"targetRef": "182dfc21-f60d-4fa0-bc43-4ff1c2e9f045"
		},
		"de193bb1-9930-4724-b988-a78faa10783e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "21605277-a793-44b6-be49-eec9610c27f2",
			"targetRef": "d714def5-92d9-4a81-9f78-ec999f265675"
		},
		"4c0c04d2-798a-4b6e-b292-66c6c5ccbb2e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "SequenceFlow11",
			"sourceRef": "c27ae2e3-02af-4950-b9a8-1762a6f46145",
			"targetRef": "2beb1c40-f819-4231-affc-bf28f7d2d784"
		},
		"ab43c7df-73f5-470f-aa3c-452fee22d695": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "SequenceFlow14",
			"sourceRef": "f3579267-6282-4935-a583-f08fcc25bdaa",
			"targetRef": "c27ae2e3-02af-4950-b9a8-1762a6f46145"
		},
		"a1ecd4d2-ed31-4fac-9c0f-84052fe7441f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow15",
			"name": "SequenceFlow15",
			"sourceRef": "3f373900-92dd-4c05-a625-4198e003bbc3",
			"targetRef": "309d64ba-4fd9-4d8d-8730-70d8f23af7bb"
		},
		"c82c8f3f-9e94-4f50-951e-f7fe00844262": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.stepStatus.d.results[0].status==\"PENDING\"}",
			"id": "sequenceflow16",
			"name": "yes",
			"sourceRef": "309d64ba-4fd9-4d8d-8730-70d8f23af7bb",
			"targetRef": "fa5018f7-c432-469c-97bb-e635990223c0"
		},
		"6d77666c-f26f-4e70-9867-7e3691346f02": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "SequenceFlow17",
			"sourceRef": "182dfc21-f60d-4fa0-bc43-4ff1c2e9f045",
			"targetRef": "cbc04df6-d8b4-496e-ab86-6b28bf5aff01"
		},
		"d7694961-10e1-4bb6-b4ac-fb28d4f3f517": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow19",
			"name": "no",
			"sourceRef": "309d64ba-4fd9-4d8d-8730-70d8f23af7bb",
			"targetRef": "c27ae2e3-02af-4950-b9a8-1762a6f46145"
		},
		"75033dd5-55f9-4f92-b669-551f37e4e19c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow21",
			"name": "SequenceFlow21",
			"sourceRef": "26131cb1-fbce-4f48-82c1-9e3091766ce8",
			"targetRef": "c27ae2e3-02af-4950-b9a8-1762a6f46145"
		},
		"4e68bb97-f93b-4e4d-85cb-859f9b578761": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow22",
			"name": "SequenceFlow22",
			"sourceRef": "587b17ae-cdbe-4422-89eb-6ef0d01d40e9",
			"targetRef": "c27ae2e3-02af-4950-b9a8-1762a6f46145"
		},
		"8b9166df-cbd9-4e97-bc7f-ebc4c304676c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow25",
			"name": "SequenceFlow25",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "21605277-a793-44b6-be49-eec9610c27f2"
		},
		"83c7052b-0a67-409e-984c-ed68905eec1c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow26",
			"name": "SequenceFlow26",
			"sourceRef": "10c6cabe-d084-4e8b-9674-14146adfb64d",
			"targetRef": "3f373900-92dd-4c05-a625-4198e003bbc3"
		},
		"ea99384c-44f5-48e9-aa6b-524dce2d88cf": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.action==\"decline\"}",
			"id": "sequenceflow28",
			"name": "decline",
			"sourceRef": "fa5018f7-c432-469c-97bb-e635990223c0",
			"targetRef": "1cac9a60-297a-4a31-ba1a-32682f791b9f"
		},
		"2a2e5069-1faa-44b1-9410-4a125bc1369d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow30",
			"name": "approve",
			"sourceRef": "fa5018f7-c432-469c-97bb-e635990223c0",
			"targetRef": "57fd8161-efbe-4bba-b980-3b2e8ba2f51b"
		},
		"8115d2b8-38d5-4546-bf25-afd1ec94f1c2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow32",
			"name": "SequenceFlow32",
			"sourceRef": "57fd8161-efbe-4bba-b980-3b2e8ba2f51b",
			"targetRef": "587b17ae-cdbe-4422-89eb-6ef0d01d40e9"
		},
		"96eade96-8c7e-4404-9438-cb0f54c5ffed": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow33",
			"name": "SequenceFlow33",
			"sourceRef": "1cac9a60-297a-4a31-ba1a-32682f791b9f",
			"targetRef": "587b17ae-cdbe-4422-89eb-6ef0d01d40e9"
		},
		"60db7826-f3de-40b2-bf1e-185dc6eb1f09": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow34",
			"name": "SequenceFlow34",
			"sourceRef": "2beb1c40-f819-4231-affc-bf28f7d2d784",
			"targetRef": "2a4b26d7-43d5-4ff6-be74-fa1f754ba3e4"
		},
		"42e25d1f-5825-4805-b7fc-3f52ec544b95": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow36",
			"name": "SequenceFlow36",
			"sourceRef": "cbc04df6-d8b4-496e-ab86-6b28bf5aff01",
			"targetRef": "fa762b08-45e3-45fe-aa44-49b539055705"
		},
		"101a735b-08e2-4886-b4e8-a1f9d705033d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow37",
			"name": "person",
			"sourceRef": "fa762b08-45e3-45fe-aa44-49b539055705",
			"targetRef": "d32bd25c-a1e2-4d39-8970-eda8b0344c8b"
		},
		"4953eaef-537e-418a-aa1a-fb169a68af42": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow39",
			"name": "SequenceFlow39",
			"sourceRef": "d32bd25c-a1e2-4d39-8970-eda8b0344c8b",
			"targetRef": "00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1"
		},
		"d40137c0-cb47-4202-898b-12572542a209": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow40",
			"name": "SequenceFlow40",
			"sourceRef": "1e1e6548-5819-4e8d-9c9d-ecb7e18b7618",
			"targetRef": "722b7aaa-300d-43d0-ae81-d7c19c891223"
		},
		"7fbdd228-acf6-4dfa-9ae8-59fda53d9f05": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.approverType.approverType=='POSITION'}",
			"id": "sequenceflow43",
			"name": "position",
			"sourceRef": "fa762b08-45e3-45fe-aa44-49b539055705",
			"targetRef": "1e1e6548-5819-4e8d-9c9d-ecb7e18b7618"
		},
		"0b8e0df4-47ab-4589-977c-454e25fd0676": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.approverType.approverType=='DYNAMIC_GROUP'}",
			"id": "sequenceflow44",
			"name": "dynamicGroup",
			"sourceRef": "fa762b08-45e3-45fe-aa44-49b539055705",
			"targetRef": "342ea8e7-b2fa-4c14-8b18-8f9abb933e29"
		},
		"eb34f897-47c3-41ee-b42e-b0443529983c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow45",
			"name": "SequenceFlow45",
			"sourceRef": "342ea8e7-b2fa-4c14-8b18-8f9abb933e29",
			"targetRef": "4084f337-384e-47eb-9e66-7e6442325fd6"
		},
		"aee9191d-b2f0-44d5-9669-78159e2a4f19": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow46",
			"name": "SequenceFlow46",
			"sourceRef": "86cfe75a-c589-4314-99ca-b39b5fab9ec1",
			"targetRef": "00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1"
		},
		"5ebf5378-ce18-40e7-84b3-e24e69da72cf": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow47",
			"name": "SequenceFlow47",
			"sourceRef": "722b7aaa-300d-43d0-ae81-d7c19c891223",
			"targetRef": "00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1"
		},
		"87a587e0-5cf5-4de9-8cd4-469c4a3b2502": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow49",
			"name": "SequenceFlow49",
			"sourceRef": "4084f337-384e-47eb-9e66-7e6442325fd6",
			"targetRef": "3003d201-e6c8-4a28-9d09-ee46414e7b4c"
		},
		"05faebc4-4a5a-4a57-bc44-101158a4935d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow50",
			"name": "SequenceFlow50",
			"sourceRef": "d714def5-92d9-4a81-9f78-ec999f265675",
			"targetRef": "26131cb1-fbce-4f48-82c1-9e3091766ce8"
		},
		"5518d3bc-49fe-4191-9e06-e428d4c79308": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow51",
			"name": "SequenceFlow51",
			"sourceRef": "f19a1e3c-c1ee-4cee-b2a5-79ab1ee2427e",
			"targetRef": "86cfe75a-c589-4314-99ca-b39b5fab9ec1"
		},
		"07a2953f-7b81-462c-9c73-90f6112a827f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow52",
			"name": "SequenceFlow52",
			"sourceRef": "3003d201-e6c8-4a28-9d09-ee46414e7b4c",
			"targetRef": "17e96ea2-e0a8-4884-8c06-96d2e2b0760e"
		},
		"f77796f9-89fc-4426-a0a1-712a1f05c182": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow53",
			"name": "SequenceFlow53",
			"sourceRef": "17e96ea2-e0a8-4884-8c06-96d2e2b0760e",
			"targetRef": "f19a1e3c-c1ee-4cee-b2a5-79ab1ee2427e"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"47130a35-7323-4607-b50b-6ff2aa8be79d": {},
				"504a1a76-5e91-4cd8-9457-aaad8490f807": {},
				"74938226-7743-405a-9ef8-2ff27511b452": {},
				"4a931d40-d22e-4064-bf93-44e370086b39": {},
				"d1fa2686-6ea8-4af9-9cc3-738ae899d550": {},
				"7e992d26-d50b-4926-b798-8247b7b47155": {},
				"7a957d48-9c47-44ff-b132-abc205def67f": {},
				"2312ea2a-f686-4a20-b17b-07afb6975682": {},
				"f80b60e8-4a43-47ff-a4c5-6547eee89e7f": {},
				"188ee9c4-2d5c-49e7-9e81-ebbeff6d8a9e": {},
				"09eb9948-f0c4-4c99-b612-f7493353c336": {},
				"ee56933b-785d-4aca-b53b-8171ed4aa484": {},
				"8286b83b-ff37-4f5a-8cda-b39f1ec13a7f": {},
				"8748d70a-f5a3-45a9-84da-d6f34b699844": {},
				"0b273d64-9eb3-4a9f-a256-070784c05ba3": {},
				"61a9a0ad-a129-4878-abcf-dee8a8604b88": {},
				"9856bb12-430a-4c18-b4af-9af5662edc0d": {},
				"36505f3d-bd0d-4f33-975a-85a6006382d9": {},
				"5d8c4aae-3a78-4eff-9001-86fe0593496e": {},
				"3d13bffc-6939-43ad-bdea-6bb163bea9bd": {},
				"985088ae-e7f2-4e29-b90a-ccd603ecb49f": {},
				"8d8cd237-93dd-4a39-870e-8bf1b43846f8": {},
				"b67cf035-219d-4c61-ab90-17a3ed488906": {},
				"fb5270d0-8bee-4356-bbf0-c43cf06f0afe": {},
				"a4e82687-f925-423b-8498-b723b1dd29e8": {},
				"63b03518-c452-45bc-959a-a4c1505d25a7": {},
				"2dc05982-c135-4aa3-837d-79d9c63e9527": {},
				"d79a47df-631b-4425-8510-6962f415ab1c": {},
				"a8c9a605-8572-46f3-8c72-cf0f8cebbeca": {},
				"ebc87b13-b6ab-4798-9e28-27e1a3adce60": {},
				"227307d0-3ee1-4f8e-a2ae-d798f3736ac6": {},
				"e0a32b83-10c5-4c52-b1ff-2fb0d86a4941": {},
				"82505606-370a-4515-844d-b9e84b86ed4e": {},
				"8da17638-2010-400c-872a-82f178863f48": {},
				"64b6f399-1f50-454f-96a2-d18557fb2bfd": {},
				"dc46acf5-e61f-4aa6-9eeb-f7f996bd0131": {},
				"71570a9b-84d6-4e2a-a972-73c688c7e371": {},
				"aa6dac6d-20d3-4d6b-98da-d1c8b08e9ab8": {},
				"ce10ad1f-014e-4f66-8114-0556ea92858b": {},
				"900153de-169c-41fd-b184-3b1aeefb736c": {},
				"d82aae05-6579-4dce-a150-f83eba955111": {},
				"066cdeb3-460b-47d0-8282-dbae860635f0": {},
				"58628f7c-307a-4f09-97b3-61fbab57666e": {},
				"d6acba85-c39d-4f77-9f6d-7125a8b1493c": {},
				"161e064a-7b39-46f6-bdee-f0235bfae8a9": {},
				"969d6e46-3f19-4cee-a04b-f8a6ec6d27ce": {},
				"86591f12-176b-4c05-b56f-e12612d1be1f": {},
				"8f726312-79f8-4e28-834f-6950691f8987": {},
				"b8f56fc0-8567-4fb5-9ee8-9c58b0e1ebe0": {},
				"5aacddad-0479-40ee-a600-7f4ede3cae29": {},
				"628bb96d-8f90-43c0-95e6-f108060f3a7a": {},
				"3b53c281-902d-4887-bc8c-254d21c164a3": {},
				"136cb584-07dd-4e2e-91fe-78e9f0333b47": {},
				"51768bc7-092c-4d07-84f0-ab148809a2cc": {},
				"f8c35dd1-eaa2-4fb9-bdc4-0d0928c4dd9d": {},
				"21422af1-190f-47a3-ab0f-a2f4e59cb091": {},
				"9ef6a8aa-d9a2-4c00-b2b7-f8f0dc8d0fbe": {},
				"9d5cc4b4-3a20-4ef7-b3e8-5c46e8432ca9": {},
				"c97d4e23-5764-4927-8cb2-e01d80817a7a": {}
			}
		},
		"1332f469-ea63-4934-83f4-063e3b00cf30": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/SpotAward/start.json",
			"id": "default-start-context"
		},
		"ebd2a95b-440b-415e-8411-3a1b50bea328": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "PT1H",
			"id": "timereventdefinition3"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 13.5,
			"y": -553,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": -1203,
			"y": -53,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"47130a35-7323-4607-b50b-6ff2aa8be79d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -23,
			"y": -445.2537887487647,
			"width": 100,
			"height": 60,
			"object": "21605277-a793-44b6-be49-eec9610c27f2"
		},
		"504a1a76-5e91-4cd8-9457-aaad8490f807": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": -25.25,
			"y": 476.12310562561765,
			"width": 100,
			"height": 60,
			"object": "00a6a8b3-aa6d-4f6e-bf82-c52b48fc9bf1",
			"symbols": {
				"bf145413-6e16-482f-992f-cf2f76b9dd41": {}
			}
		},
		"74938226-7743-405a-9ef8-2ff27511b452": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "24.9921875,506.1973835748171 167.9921875,506.1973835748171",
			"sourceSymbol": "504a1a76-5e91-4cd8-9457-aaad8490f807",
			"targetSymbol": "fb5270d0-8bee-4356-bbf0-c43cf06f0afe",
			"object": "65d2cba0-784b-464e-9e61-8eea4bc3e678"
		},
		"4a931d40-d22e-4064-bf93-44e370086b39": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -25.375,
			"y": -64.68844718719117,
			"width": 100,
			"height": 60,
			"object": "c27ae2e3-02af-4950-b9a8-1762a6f46145"
		},
		"d1fa2686-6ea8-4af9-9cc3-738ae899d550": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": -963.4375,
			"y": -56.09422359359564,
			"object": "2a4b26d7-43d5-4ff6-be74-fa1f754ba3e4"
		},
		"7e992d26-d50b-4926-b798-8247b7b47155": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-942.4765625,-35.39855589839891 -1185.5,-35.39855589839891",
			"sourceSymbol": "d1fa2686-6ea8-4af9-9cc3-738ae899d550",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "a03855e5-b2bf-4b5d-b2ed-9034d562244b"
		},
		"7a957d48-9c47-44ff-b132-abc205def67f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-942.23046875,-14.594223593595643 -942.23046875,234.3468866604071",
			"sourceSymbol": "d1fa2686-6ea8-4af9-9cc3-738ae899d550",
			"targetSymbol": "61a9a0ad-a129-4878-abcf-dee8a8604b88",
			"object": "a17bec2c-5231-41b1-b136-68b2199983ac"
		},
		"2312ea2a-f686-4a20-b17b-07afb6975682": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 155.6875,
			"y": 56.7173292192133,
			"width": 100,
			"height": 60,
			"object": "57fd8161-efbe-4bba-b980-3b2e8ba2f51b"
		},
		"f80b60e8-4a43-47ff-a4c5-6547eee89e7f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "27.078125,-415.2537887487647 27.078125,-289.11245335837134",
			"sourceSymbol": "47130a35-7323-4607-b50b-6ff2aa8be79d",
			"targetSymbol": "136cb584-07dd-4e2e-91fe-78e9f0333b47",
			"object": "de193bb1-9930-4724-b988-a78faa10783e"
		},
		"188ee9c4-2d5c-49e7-9e81-ebbeff6d8a9e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "24.625,-35.5 -428.65625,-35.5",
			"sourceSymbol": "4a931d40-d22e-4064-bf93-44e370086b39",
			"targetSymbol": "e0a32b83-10c5-4c52-b1ff-2fb0d86a4941",
			"object": "4c0c04d2-798a-4b6e-b292-66c6c5ccbb2e"
		},
		"09eb9948-f0c4-4c99-b612-f7493353c336": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "24.75,460.12310562561765 24.75,227.7173309326172 25.625,227.7173309326172 25.625,-4.188447187191173",
			"sourceSymbol": "bf145413-6e16-482f-992f-cf2f76b9dd41",
			"targetSymbol": "4a931d40-d22e-4064-bf93-44e370086b39",
			"object": "ab43c7df-73f5-470f-aa3c-452fee22d695"
		},
		"ee56933b-785d-4aca-b53b-8171ed4aa484": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 268.71875,
			"y": 476.4202174224155,
			"width": 100,
			"height": 60,
			"object": "3f373900-92dd-4c05-a625-4198e003bbc3"
		},
		"8286b83b-ff37-4f5a-8cda-b39f1ec13a7f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "318.7109375,506.4202174224155 318.7109375,317.0687733208144",
			"sourceSymbol": "ee56933b-785d-4aca-b53b-8171ed4aa484",
			"targetSymbol": "8748d70a-f5a3-45a9-84da-d6f34b699844",
			"object": "a1ecd4d2-ed31-4fac-9c0f-84052fe7441f"
		},
		"8748d70a-f5a3-45a9-84da-d6f34b699844": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 297.703125,
			"y": 296.0687733208144,
			"object": "309d64ba-4fd9-4d8d-8730-70d8f23af7bb"
		},
		"0b273d64-9eb3-4a9f-a256-070784c05ba3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "319.52734375,296.5687733208144 319.52734375,205.5687733208144",
			"sourceSymbol": "8748d70a-f5a3-45a9-84da-d6f34b699844",
			"targetSymbol": "63b03518-c452-45bc-959a-a4c1505d25a7",
			"object": "c82c8f3f-9e94-4f50-951e-f7fe00844262"
		},
		"61a9a0ad-a129-4878-abcf-dee8a8604b88": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -991.609375,
			"y": 200.78799691440992,
			"width": 100,
			"height": 60,
			"object": "182dfc21-f60d-4fa0-bc43-4ff1c2e9f045"
		},
		"9856bb12-430a-4c18-b4af-9af5662edc0d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-941.751953125,230.78799691440992 -941.751953125,505.62177784563266",
			"sourceSymbol": "61a9a0ad-a129-4878-abcf-dee8a8604b88",
			"targetSymbol": "64b6f399-1f50-454f-96a2-d18557fb2bfd",
			"object": "6d77666c-f26f-4e70-9867-7e3691346f02"
		},
		"36505f3d-bd0d-4f33-975a-85a6006382d9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "298.203125,317.0687733208144 24.625,317.06878662109375 24.625,-5.188447187191173",
			"sourceSymbol": "8748d70a-f5a3-45a9-84da-d6f34b699844",
			"targetSymbol": "4a931d40-d22e-4064-bf93-44e370086b39",
			"object": "d7694961-10e1-4bb6-b4ac-fb28d4f3f517"
		},
		"5d8c4aae-3a78-4eff-9001-86fe0593496e": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -22.6875,
			"y": -192.97111796797793,
			"width": 100,
			"height": 60,
			"object": "26131cb1-fbce-4f48-82c1-9e3091766ce8"
		},
		"3d13bffc-6939-43ad-bdea-6bb163bea9bd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "25.96875,-162.97111796797793 25.96875,-34.68844718719117",
			"sourceSymbol": "5d8c4aae-3a78-4eff-9001-86fe0593496e",
			"targetSymbol": "4a931d40-d22e-4064-bf93-44e370086b39",
			"object": "75033dd5-55f9-4f92-b669-551f37e4e19c"
		},
		"985088ae-e7f2-4e29-b90a-ccd603ecb49f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 269.15625,
			"y": -64.98555898398894,
			"width": 100,
			"height": 60,
			"object": "587b17ae-cdbe-4422-89eb-6ef0d01d40e9"
		},
		"8d8cd237-93dd-4a39-870e-8bf1b43846f8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "319.15625,-34.837003085590055 24.625,-34.837003085590055",
			"sourceSymbol": "985088ae-e7f2-4e29-b90a-ccd603ecb49f",
			"targetSymbol": "4a931d40-d22e-4064-bf93-44e370086b39",
			"object": "4e68bb97-f93b-4e4d-85cb-859f9b578761"
		},
		"b67cf035-219d-4c61-ab90-17a3ed488906": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "28.25,-537 28.25,-444.7537887487647",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "47130a35-7323-4607-b50b-6ff2aa8be79d",
			"object": "8b9166df-cbd9-4e97-bc7f-ebc4c304676c"
		},
		"fb5270d0-8bee-4356-bbf0-c43cf06f0afe": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 118.234375,
			"y": 476.27166152401657,
			"width": 100,
			"height": 60,
			"object": "10c6cabe-d084-4e8b-9674-14146adfb64d"
		},
		"a4e82687-f925-423b-8498-b723b1dd29e8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "168.234375,506.34593947321605 318.71875,506.34593947321605",
			"sourceSymbol": "fb5270d0-8bee-4356-bbf0-c43cf06f0afe",
			"targetSymbol": "ee56933b-785d-4aca-b53b-8171ed4aa484",
			"object": "83c7052b-0a67-409e-984c-ed68905eec1c"
		},
		"63b03518-c452-45bc-959a-a4c1505d25a7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 298.203125,
			"y": 164.0687733208144,
			"object": "fa5018f7-c432-469c-97bb-e635990223c0"
		},
		"2dc05982-c135-4aa3-837d-79d9c63e9527": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "339.703125,185.0687733208144 430.6953125,185.0687713623047 430.6953125,115.9809122954141",
			"sourceSymbol": "63b03518-c452-45bc-959a-a4c1505d25a7",
			"targetSymbol": "d79a47df-631b-4425-8510-6962f415ab1c",
			"object": "ea99384c-44f5-48e9-aa6b-524dce2d88cf"
		},
		"d79a47df-631b-4425-8510-6962f415ab1c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 380.6953125,
			"y": 56.89305127001384,
			"width": 100,
			"height": 60,
			"object": "1cac9a60-297a-4a31-ba1a-32682f791b9f"
		},
		"a8c9a605-8572-46f3-8c72-cf0f8cebbeca": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "319.203125,184.89305127001384 205.6875,184.89305114746094 205.6875,116.2173292192133",
			"sourceSymbol": "63b03518-c452-45bc-959a-a4c1505d25a7",
			"targetSymbol": "2312ea2a-f686-4a20-b17b-07afb6975682",
			"object": "2a2e5069-1faa-44b1-9410-4a125bc1369d"
		},
		"ebc87b13-b6ab-4798-9e28-27e1a3adce60": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "205.6875,57.7173292192133 205.6875,25.615886688232422 319.15625,25.615886688232422 319.15625,-5.485558983988938",
			"sourceSymbol": "2312ea2a-f686-4a20-b17b-07afb6975682",
			"targetSymbol": "985088ae-e7f2-4e29-b90a-ccd603ecb49f",
			"object": "8115d2b8-38d5-4546-bf25-afd1ec94f1c2"
		},
		"227307d0-3ee1-4f8e-a2ae-d798f3736ac6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "431.6953125,58.89305127001384 431.6953125,25.703746795654297 319.15625,25.703746795654297 319.15625,-5.485558983988938",
			"sourceSymbol": "d79a47df-631b-4425-8510-6962f415ab1c",
			"targetSymbol": "985088ae-e7f2-4e29-b90a-ccd603ecb49f",
			"object": "96eade96-8c7e-4404-9438-cb0f54c5ffed"
		},
		"e0a32b83-10c5-4c52-b1ff-2fb0d86a4941": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -478.65625,
			"y": -65.39133539039341,
			"width": 100,
			"height": 60,
			"object": "2beb1c40-f819-4231-affc-bf28f7d2d784"
		},
		"82505606-370a-4515-844d-b9e84b86ed4e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-428.65625,-35.242779491994526 -942.4375,-35.242779491994526",
			"sourceSymbol": "e0a32b83-10c5-4c52-b1ff-2fb0d86a4941",
			"targetSymbol": "d1fa2686-6ea8-4af9-9cc3-738ae899d550",
			"object": "60db7826-f3de-40b2-bf1e-185dc6eb1f09"
		},
		"8da17638-2010-400c-872a-82f178863f48": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": -809.1796875,
			"y": 484.95555877685547,
			"object": "fa762b08-45e3-45fe-aa44-49b539055705"
		},
		"64b6f399-1f50-454f-96a2-d18557fb2bfd": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -991.89453125,
			"y": 475.62177784563266,
			"width": 100,
			"height": 60,
			"object": "cbc04df6-d8b4-496e-ab86-6b28bf5aff01"
		},
		"dc46acf5-e61f-4aa6-9eeb-f7f996bd0131": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-942.037109375,505.78866831124407 -788.037109375,505.78866831124407",
			"sourceSymbol": "64b6f399-1f50-454f-96a2-d18557fb2bfd",
			"targetSymbol": "8da17638-2010-400c-872a-82f178863f48",
			"object": "42e25d1f-5825-4805-b7fc-3f52ec544b95"
		},
		"71570a9b-84d6-4e2a-a972-73c688c7e371": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -660.21484375,
			"y": 621.5393371582031,
			"width": 100,
			"height": 60,
			"object": "1e1e6548-5819-4e8d-9c9d-ecb7e18b7618"
		},
		"aa6dac6d-20d3-4d6b-98da-d1c8b08e9ab8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-767.6796875,505.95555877685547 -478.6796875,505.95555877685547",
			"sourceSymbol": "8da17638-2010-400c-872a-82f178863f48",
			"targetSymbol": "ce10ad1f-014e-4f66-8114-0556ea92858b",
			"object": "101a735b-08e2-4886-b4e8-a1f9d705033d"
		},
		"ce10ad1f-014e-4f66-8114-0556ea92858b": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -479.1796875,
			"y": 475.95555877685547,
			"width": 100,
			"height": 60,
			"object": "d32bd25c-a1e2-4d39-8970-eda8b0344c8b"
		},
		"900153de-169c-41fd-b184-3b1aeefb736c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-429.1796875,506.03933220123656 -24.75,506.03933220123656",
			"sourceSymbol": "ce10ad1f-014e-4f66-8114-0556ea92858b",
			"targetSymbol": "504a1a76-5e91-4cd8-9457-aaad8490f807",
			"object": "4953eaef-537e-418a-aa1a-fb169a68af42"
		},
		"d82aae05-6579-4dce-a150-f83eba955111": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -313.21484375,
			"y": 621.5393371582031,
			"width": 100,
			"height": 60,
			"object": "722b7aaa-300d-43d0-ae81-d7c19c891223"
		},
		"066cdeb3-460b-47d0-8282-dbae860635f0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-610.21484375,651.5393371582031 -263.21484375,651.5393371582031",
			"sourceSymbol": "71570a9b-84d6-4e2a-a972-73c688c7e371",
			"targetSymbol": "d82aae05-6579-4dce-a150-f83eba955111",
			"object": "d40137c0-cb47-4202-898b-12572542a209"
		},
		"58628f7c-307a-4f09-97b3-61fbab57666e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-788.1796875,526.4555587768555 -788.1796875,651.539306640625 -659.71484375,651.5393371582031",
			"sourceSymbol": "8da17638-2010-400c-872a-82f178863f48",
			"targetSymbol": "71570a9b-84d6-4e2a-a972-73c688c7e371",
			"object": "7fbdd228-acf6-4dfa-9ae8-59fda53d9f05"
		},
		"d6acba85-c39d-4f77-9f6d-7125a8b1493c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -660.1796875,
			"y": 179.95555877685547,
			"width": 100,
			"height": 59,
			"object": "342ea8e7-b2fa-4c14-8b18-8f9abb933e29"
		},
		"161e064a-7b39-46f6-bdee-f0235bfae8a9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-788.1796875,485.45555877685547 -788.1796875,209.45556640625 -659.6796875,209.45555877685547",
			"sourceSymbol": "8da17638-2010-400c-872a-82f178863f48",
			"targetSymbol": "d6acba85-c39d-4f77-9f6d-7125a8b1493c",
			"object": "0b8e0df4-47ab-4589-977c-454e25fd0676"
		},
		"969d6e46-3f19-4cee-a04b-f8a6ec6d27ce": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -313.1796875,
			"y": 347.45555877685547,
			"width": 100,
			"height": 60,
			"object": "86cfe75a-c589-4314-99ca-b39b5fab9ec1"
		},
		"86591f12-176b-4c05-b56f-e12612d1be1f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-610.1796875,209.58055877685547 -428.9296875,209.58055877685547",
			"sourceSymbol": "d6acba85-c39d-4f77-9f6d-7125a8b1493c",
			"targetSymbol": "628bb96d-8f90-43c0-95e6-f108060f3a7a",
			"object": "eb34f897-47c3-41ee-b42e-b0443529983c"
		},
		"8f726312-79f8-4e28-834f-6950691f8987": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-263.1796875,377.45555877685547 -118.96484375,377.45556640625 -118.96484375,506.12310791015625 -24.75,506.12310562561765",
			"sourceSymbol": "969d6e46-3f19-4cee-a04b-f8a6ec6d27ce",
			"targetSymbol": "504a1a76-5e91-4cd8-9457-aaad8490f807",
			"object": "aee9191d-b2f0-44d5-9669-78159e2a4f19"
		},
		"b8f56fc0-8567-4fb5-9ee8-9c58b0e1ebe0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-263.21484375,651.5393371582031 -118.982421875,651.539306640625 -118.982421875,506.12310791015625 -24.75,506.12310562561765",
			"sourceSymbol": "d82aae05-6579-4dce-a150-f83eba955111",
			"targetSymbol": "504a1a76-5e91-4cd8-9457-aaad8490f807",
			"object": "5ebf5378-ce18-40e7-84b3-e24e69da72cf"
		},
		"5aacddad-0479-40ee-a600-7f4ede3cae29": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -312.6796875,
			"y": 179.95555877685547,
			"width": 100,
			"height": 60,
			"object": "3003d201-e6c8-4a28-9d09-ee46414e7b4c"
		},
		"628bb96d-8f90-43c0-95e6-f108060f3a7a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -478.9296875,
			"y": 179.70555877685547,
			"width": 100,
			"height": 60,
			"object": "4084f337-384e-47eb-9e66-7e6442325fd6"
		},
		"3b53c281-902d-4887-bc8c-254d21c164a3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-428.9296875,209.83055877685547 -262.6796875,209.83055877685547",
			"sourceSymbol": "628bb96d-8f90-43c0-95e6-f108060f3a7a",
			"targetSymbol": "5aacddad-0479-40ee-a600-7f4ede3cae29",
			"object": "87a587e0-5cf5-4de9-8cd4-469c4a3b2502"
		},
		"136cb584-07dd-4e2e-91fe-78e9f0333b47": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -22.84375,
			"y": -319.11245335837134,
			"width": 100,
			"height": 60,
			"object": "d714def5-92d9-4a81-9f78-ec999f265675"
		},
		"51768bc7-092c-4d07-84f0-ab148809a2cc": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "27.234375,-289.11245335837134 27.234375,-162.97111796797793",
			"sourceSymbol": "136cb584-07dd-4e2e-91fe-78e9f0333b47",
			"targetSymbol": "5d8c4aae-3a78-4eff-9001-86fe0593496e",
			"object": "05faebc4-4a5a-4a57-bc44-101158a4935d"
		},
		"f8c35dd1-eaa2-4fb9-bdc4-0d0928c4dd9d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -478.9296875,
			"y": 347.20555877685547,
			"width": 100,
			"height": 60,
			"object": "f19a1e3c-c1ee-4cee-b2a5-79ab1ee2427e"
		},
		"21422af1-190f-47a3-ab0f-a2f4e59cb091": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-428.9296875,377.33055877685547 -263.1796875,377.33055877685547",
			"sourceSymbol": "f8c35dd1-eaa2-4fb9-bdc4-0d0928c4dd9d",
			"targetSymbol": "969d6e46-3f19-4cee-a04b-f8a6ec6d27ce",
			"object": "5518d3bc-49fe-4191-9e06-e428d4c79308"
		},
		"9ef6a8aa-d9a2-4c00-b2b7-f8f0dc8d0fbe": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-261.6796875,234.95555877685547 -261.6796875,293.64306640625 -710.9296875,293.64306640625 -710.9296875,380.83056640625 -660.4296875,380.83056640625",
			"sourceSymbol": "5aacddad-0479-40ee-a600-7f4ede3cae29",
			"targetSymbol": "9d5cc4b4-3a20-4ef7-b3e8-5c46e8432ca9",
			"object": "07a2953f-7b81-462c-9c73-90f6112a827f"
		},
		"9d5cc4b4-3a20-4ef7-b3e8-5c46e8432ca9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -660.4296875,
			"y": 346.83056640625,
			"width": 100,
			"height": 60,
			"object": "17e96ea2-e0a8-4884-8c06-96d2e2b0760e"
		},
		"c97d4e23-5764-4927-8cb2-e01d80817a7a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-610.4296875,377.01806259155273 -428.9296875,377.01806259155273",
			"sourceSymbol": "9d5cc4b4-3a20-4ef7-b3e8-5c46e8432ca9",
			"targetSymbol": "f8c35dd1-eaa2-4fb9-bdc4-0d0928c4dd9d",
			"object": "f77796f9-89fc-4426-a0a1-712a1f05c182"
		},
		"bf145413-6e16-482f-992f-cf2f76b9dd41": {
			"classDefinition": "com.sap.bpm.wfs.ui.BoundaryEventSymbol",
			"x": 8.75,
			"y": 460.12310562561765,
			"object": "f3579267-6282-4935-a583-f08fcc25bdaa"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 4,
			"hubapireference": 2,
			"sequenceflow": 53,
			"startevent": 1,
			"intermediatetimerevent": 1,
			"boundarytimerevent": 2,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 12,
			"scripttask": 10,
			"exclusivegateway": 8
		}
	}
}