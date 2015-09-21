namespace MarsTimeModule.Common
{
    public class Interval
    {
        private readonly Moment _startMoment;
        private readonly Moment _endMoment;

        public Interval(Moment startMoment, Moment endMoment)
        {
            _startMoment = startMoment;
            _endMoment = endMoment;
        }

        public IntervalRelation GetRelation(Interval interval)
        {
            return IntervalRelation.Nested;
        }

        public override string ToString()
        {
            return string.Format("{0} - {1}", _startMoment, _endMoment);
        }
    }
}