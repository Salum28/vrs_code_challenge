package helpers

import (
	http "net/http"
	gin "github.com/gin-gonic/gin"
)

type ErrorWithSuggestedStatus struct {
	ErrorMsg string
	Status int
}

func (e *ErrorWithSuggestedStatus) Error() string {
	return e.ErrorMsg
}

func PassErrorWithSuggestedStatus(prefix string, err error) *ErrorWithSuggestedStatus {
	if err == nil {
		return nil
	}

	if ers, ok := err.(*ErrorWithSuggestedStatus); ok {
		return &ErrorWithSuggestedStatus{
			ErrorMsg: prefix + ": \n|->" + ers.ErrorMsg,
			Status: ers.Status,
		}
	}

	return &ErrorWithSuggestedStatus{
		ErrorMsg: prefix + ": \n|->" + err.Error(),
		Status: http.StatusInternalServerError,
	}
}

func FeedErrorToResponse(prefix string, err error, c *gin.Context) {
	errs := PassErrorWithSuggestedStatus(prefix, err)
	c.JSON(errs.Status, gin.H{"error": errs.Error()})
	c.Abort()
}