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

        public IntervalRelation Comapre(Interval intervalToCompare)
        {
            if (intervalToCompare._endMoment < _startMoment || _endMoment < intervalToCompare._startMoment) return IntervalRelation.Disjoint;
            if (intervalToCompare._endMoment <= _startMoment || _endMoment <= intervalToCompare._startMoment) return IntervalRelation.Touch;
            if (_startMoment <= intervalToCompare._startMoment && _endMoment >= intervalToCompare._endMoment) return IntervalRelation.Nested;
            
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