
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
    }, getButtons(path, extra) {//extra自定额外按钮
        console.log('grid');
        let permission = $vue.$store.getters.getPermission(path);
        if (!permission) {
            $vue.permission.to401();
            return;
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