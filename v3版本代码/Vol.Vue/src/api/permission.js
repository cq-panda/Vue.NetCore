
import http from '@/../src/api/http.js'
import buttons from '@/../config/buttons.js'

// let permission = {
//     install(Vue, config) {
//         Vue.prototype.permission = {

//         }
//     }
// }
//Vue.use(permission);
let $vue = null;
let permission = {
    init(vue) {
        $vue = vue;
    },
    getMenu() {
        return http.get("/api/getTreeMenu");
    }, getButtons(path, extra, table) {//extra自定额外按钮
        //  console.log('grid');
        //table获取指定表的权限
        if (table) {
            table='/'+table;
        }
        let permission = $vue.$store.getters.getPermission(table || path);
        if (!permission) {
            permission = $vue.$store.getters.getPermission(path.substring(1));
            if (!permission) {
                $vue.permission.to401();
                return;
            }
        }

        let permissions = permission.permission;//.split(',');
        let gridButtons = buttons.filter(item => {
            return !item.value || permissions.indexOf(item.value) != -1
        });
        if (extra && extra instanceof Array) {
            gridButtons.push(...extra)
        }
        return gridButtons;
    }, to401() {
        $vue.$router.push({
            path: '/401'
        });
    }
}

export default permission;