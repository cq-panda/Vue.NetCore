/*
*所有关于SellOrder类的业务代码接口应在此处编写
*/
using VOL.Core.BaseProvider;
using VOL.Entity.DomainModels;
namespace VOL.Order.IServices
{
    public partial interface ISellOrderService
    {
        string GetServiceDate();
    }
 }
