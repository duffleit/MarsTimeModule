using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MarsTimeModule.Common;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TechTalk.SpecFlow;

namespace MarsTimeModule.Test.StepDefintions
{
    [Binding]
    public sealed class IntervallDefintions
    {
        private readonly Stack<Interval> _intervals;
        private IntervalRelation? _lastIntervalStatus = null;

        public IntervallDefintions()
        {
            _intervals = new Stack<Interval>();
        }

        [Given(@"is a mars time interval with a starttime of (.*) and a endtime of (.*)")]
        public void GivenIsAMarsTimeIntervalWithAStartingtimeOfAndAEndingtimeOf(string startMomentStr, string endMomentStr)
        {
            var startMoment = Moment.Parse(startMomentStr);
            var endMoment = Moment.Parse(endMomentStr);

            var interval = new Interval(startMoment, endMoment);

            _intervals.Push(interval);
        }

        [Then(@"the relation of the last two added intervals is (.*)")]
        public void ThenTheRelationOfTheLastTwoAddedIntervalsIs(string relationStr)
        {
            if(_intervals.Count < 2)
                throw new BindingException("This step can only be run if more then two intervals are given.");

            IntervalRelation expectedRelation;
            if(!Enum.TryParse(relationStr, true, out expectedRelation))
                throw new BindingException("Relation can not be parsed.");

            var lastInterval = _intervals.Pop();
            var foreLastInterval = _intervals.Pop();
            var relation = foreLastInterval.GetRelation(lastInterval);

            Assert.AreEqual(expectedRelation, relation);
        }
    }
}
