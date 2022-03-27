//************************************************
//  *Author：jxx
//  *QQ：283591387
//  *自定义业务逻辑扩展
//************************************************
export default function() {
	return {
		methods: {
			onInited() { //页面参数初始化
				//设置table超出换行显示
				//this.textInline = false;

				//设置列宽度
				//this.columns[1].width = 70;

				//设置table为水平显示或者list列表显示
				this.direction = 'horizontal'//list
	
                
				this.columns.forEach(column=>{
					if(["Creator","Modifier","ModifyDate","PhoneNo"].indexOf(column.field)!=-1){
						column.hidden=true;
					}
					if(column.field=='CreateDate'){
						column.type="date";
					}
					if(column.field=='Describe'){
						column.width=140;
					}
				})
				
				//显示行号
				this.rowIndex=true;
			},
			formatter(row, column) { //自定义格式化
				// if(column.field=='xx'){
				//  return '<a style="color:red;">' + row[column.field] + '</a>';
				// }
				//return row[column.field]
			},
			rowClick(index, row, column) { //行点击事件
				return true;
			},
			updateBefore(formData) { //更新保存前操作
				return true;
			},
			addBefore(formData) {//新建保存前操作
				return true;
			}
		}
	}
}
