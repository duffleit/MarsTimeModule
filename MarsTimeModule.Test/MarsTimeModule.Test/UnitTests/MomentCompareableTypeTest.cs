using MarsTimeModule.Common;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace MarsTimeModule.Test.UnitTests
{
    [TestClass]
    public class MomentCompareableTypeTest
    {
        [TestMethod]
        public void CompareTwoMoments()
        {
            Assert.IsTrue(new Moment(10, 10) > new Moment(9, 23));
            Assert.IsTrue(new Moment(24, 99) > new Moment(24, 98));

            Assert.IsTrue(new Moment(12, 20) < new Moment(14, 20));
            Assert.IsTrue(new Moment(14, 32) < new Moment(14, 40));
            Assert.IsTrue(new Moment(1, 1) < new Moment(12, 12));

            Assert.IsTrue(new Moment(12, 13) >= new Moment(11,11));
            Assert.IsTrue(new Moment(16, 53) >= new Moment(16,53));

            Assert.IsTrue(new Moment(6, 98) <= new Moment(7, 30));
            Assert.IsTrue(new Moment(11, 78) <= new Moment(11, 78));
        }

    }
}