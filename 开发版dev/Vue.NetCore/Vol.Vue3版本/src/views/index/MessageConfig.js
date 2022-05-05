import * as signalR from '@microsoft/signalr';
import { ElNotification } from 'element-plus';

export default function (http, receive) {
  let connection;
  http.post('api/user/GetCurrentUserInfo').then((result) => {
    connection = new signalR.HubConnectionBuilder()
      .withAutomaticReconnect()
      .withUrl(`${http.ipAddress}message?userName=${result.data.userName}`)
     //.withUrl(`${http.ipAddress}message`)
      .build();

    connection.start().catch((err) => console.log(ex.message));
    //自动重连成功后的处理
    connection.onreconnected((connectionId) => {
      console.log(connectionId);
    });
    connection.on('ReceiveHomePageMessage', function (data) {
      console.log(data)
      ElNotification.success({
        title:data.title,
        message: data.message + '',
        type: 'info'
      });
      receive && receive(data);
    });
  });
}
