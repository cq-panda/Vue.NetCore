namespace VOL.Entity.DomainModels.System
{
    public class GKResponse
    {
        public GKResponse() { }
        public GKResponse(int state)
        {
            this.state = state;
        }
        public int state { get; set; }
        public string message { get; set; }
        public object data { get; set; }
    }
}
