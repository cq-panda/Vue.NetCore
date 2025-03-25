using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.ObjectActionValidator
{
    public class ObjectModelValidatorState
    {
        public ObjectModelValidatorState()
        {
            this.Status = true;
        }

        public bool Status { get; set; }
        public bool HasModelContent { get; set; }
        public string Code { get; set; }
        public string Message { get; set; }
    }
    public class ObjectValidatorResult
    {
        public ObjectValidatorResult()
        {

        }
        public ObjectValidatorResult(bool status)
        {
            this.Status = status;
        }
        public ObjectValidatorResult OK(string message)
        {
            this.Status = true;
            this.Message = message;
            return this;
        }
        public ObjectValidatorResult Error(string message)
        {
            this.Status = false;
            this.Message = message;
            return this;
        }
        public bool Status { get; set; }
        public string Message { get; set; }
    }
}
