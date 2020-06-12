// The core potential assignees, by their email addresses
var safetyofficer = "scott.d@saptechnicalacademy.com";
var generalofficer = "mark.m@saptechnicalacademy.com";
var assignee;

// Make an assignment depending on the category
if ($.context.incident.category_code === "security") {
	assignee = safetyofficer;
} else {
	assignee = generalofficer;
}

// Get the details of the individual who has been assigned
var individual = $.context.individuals.value.filter(
	function(x) {
		return x.emailAddress === assignee; 
	})[0]; 

// Prepare an OData update payload to set the incident's assignment
$.context.assignmentpayload = {
	assignedIndividual_ID: individual.ID,
	incidentStatus_code: "assigned"
};
	
// Make the assignee available for use in the user task
$.context.assignee = assignee;
