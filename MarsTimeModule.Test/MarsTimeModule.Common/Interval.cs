using System;

namespace MarsTimeModule.Common
{
    public class Interval
    {
        #region Fields

        private readonly Moment _startMoment;
        private readonly Moment _endMoment;

        #endregion

        #region Constructor

        public Interval(Moment startMoment, Moment endMoment)
        {
            if(endMoment < startMoment) throw new ArgumentException("endMoment has to be later the startMoment.");

            _startMoment = startMoment;
            _endMoment = endMoment;
        }

        #endregion

        public IntervalRelation Compare(Interval intervalToCompare)
        {
            Func<Interval, Interval, bool> isNested = (start, end) => (start._startMoment <= end._startMoment && start._endMoment >= end._endMoment);

            if (intervalToCompare._endMoment < _startMoment || _endMoment < intervalToCompare._startMoment) return IntervalRelation.Disjoint;
            if (intervalToCompare._endMoment <= _startMoment || _endMoment <= intervalToCompare._startMoment) return IntervalRelation.Touch;
            if (isNested(this, intervalToCompare) || isNested(intervalToCompare, this)) return IntervalRelation.Nested;
            
            return IntervalRelation.Overlap;
        }

        #region ToString

        public override string ToString()
        {
            return string.Format("{0} - {1}", _startMoment, _endMoment);
        }

        #endregion
    }
}