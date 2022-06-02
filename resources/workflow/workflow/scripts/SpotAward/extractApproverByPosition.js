/*
// read from existing workflow context 
var productInfo = $.context.productInfo; 
var productName = productInfo.productName; 
var productDescription = productInfo.productDescription;

// read contextual information
var taskDefinitionId = $.info.taskDefinitionId;

// read user task information
var lastUserTask1 = $.usertasks.usertask1.last;
var userTaskSubject = lastUserTask1.subject;
var userTaskProcessor = lastUserTask1.processor;
var userTaskCompletedAt = lastUserTask1.completedAt;

var userTaskStatusMessage = " User task '" + userTaskSubject + "' has been completed by " + userTaskProcessor + " at " + userTaskCompletedAt;

// create new node 'product'
var product = {
		productDetails: productName  + " " + productDescription,
		workflowStep: taskDefinitionId
};

// write 'product' node to workflow context
$.context.product = product;
*/

var jobInfo = $.context.jobInfo.d.results;

var approver = [];
var approverIdMap = {};

for (var i = 0; i < jobInfo.length; i++) {
    approver.push(jobInfo[i].userNav.personKeyNav.userAccountNav.username);
    approverIdMap[jobInfo[i].userNav.personKeyNav.userAccountNav.username] = jobInfo[i].userId;
}

$.context.approver = approver;
$.context.approverIdMap = approverIdMap;