using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MarsTimeModule.Common;
using TechTalk.SpecFlow;

namespace MarsTimeModule.Test.StepDefintions
{
    [Binding]
    public sealed class IntervallDefintions
    {
        public Stack<Interval> _intervalls;

        public IntervallDefintions()
        {
            _intervalls = new Stack<Interval>();
        }

        [Given(@"is a mars time interval with a startingtime of (.*) and a endingtime of (.*)")]
        public void GivenIsAMarsTimeIntervalWithAStartingtimeOfAndAEndingtimeOf(string intervalFrom, string intervalTo)
        {
            var startMoment = Moment.Parse(intervalFrom);
            var endMoment = Moment.Parse(intervalTo);

            var interval = new Interval(startMoment, endMoment);

            _intervalls.Push(interval);
        }

        [When(@"the last two intervals are compared")]
        public void WhenTheLastTwoIntervalsAreCompared()
        {
            ScenarioContext.Current.Pending();
        }

        [Then(@"the result is (.*)")]
        public void ThenTheResultIs(string p0)
        {
            ScenarioContext.Current.Pending();
        }
    }
}
