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

var response = $.context.workflowPendingData.value[0];
var userDetail = $.context.workflowUserDetail.value[0];

var pendingData = {
    approvalStatus: response.approvalStatus,
    lastModifiedDateTime: response.lastModifiedDateTime,
    createdDateTime: response.createdDateTime,
    spotAwardProgram: response.spotAwardProgramNav === null ? '' : response.spotAwardProgramNav.displayedProgramName,
    guidelineAmount: response.guidelineAmount,
    approvedDate: response.approvedDate,
    awardAmount: response.awardAmount,
    currency: response.currency,
    commentForReceiver: response.commentForReceiver,
    commentForApprovers: response.commentForApprovers,
    nominatorFullName: userDetail.nominatorFullName,
    nomineeFullName: userDetail.nomineeFullName,
    category: response.categoryNav === null ? '' : response.categoryNav.title,
    level: response.levelNav === null ? '' : response.levelNav.title
    // budgetHolderId: response.budgetHolderIdNav === null ? '' : response.budgetHolderIdNav.defaultFullName
}
$.context.workflowPendingData = pendingData;
