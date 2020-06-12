var decision = $.usertasks.usertask3.last.decision || $.context.customDecision;

// Get ready to set incident to resolved/closed and add comment to the description
$.context.incidentUpdateRequest = {
	incidentStatus_code: decision === "confirm" ? "resolved" : "closed"
};