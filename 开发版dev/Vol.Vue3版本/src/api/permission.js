
import http from '@/../src/api/http.js'
import buttons from '@/../config/buttons.js'
import store from '../store/index'
import { useRouter } from 'vue-router'
let permission = {
    getMenu() {
        return http.get("/api/getTreeMenu");
    }, getButtons(path, extra, table, tableName) {//extra自定额外按钮
       //extra自定额外按钮
    //table获取指定表的权限
    if (table) {
        table = '/' + table;
      }
      let permission = store.getters.getPermission(table || path);
      if (!permission) {
        permission = store.getters.getPermission(path.substring(1));
        if (!permission) {
          if ((tableName || '').indexOf('/') != -1) {
            let arr = tableName.split('/');
            tableName = arr[arr.length - 1];
          }
          permission = store.getters.getPermission('/' + tableName);
          if (!permission) {
            permission = (store.state.permission||[]).find(x => x.tableName ==tableName);
            if (!permission) {
              to401();
              return;
            }
          }
        }
      }
  
      let permissions = permission.permission; //.split(',');
      let gridButtons = buttons.filter((item) => {
        return !item.value || permissions.indexOf(item.value) != -1;
      });
      if (extra && extra instanceof Array) {
        gridButtons.push(...extra);
      }
      return gridButtons;
    }, to401() {
        to401();
    }
}
function to401() {
    const router = useRouter();
    router.push({
        path: '/401'
    });
}

export default permission;