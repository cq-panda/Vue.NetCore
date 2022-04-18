<template>
	<view class="md-form">
		<vol-form ref="form" :form-options="formOptions" :formFields.sync="formFields">
		</vol-form>
		<view style="margin: 60rpx 30rpx">
			<u-button icon="lock-open" size="large" shape="circle" @click="submit"  type="primary"
				text="修改密码">
				
			</u-button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				formFields: {
					oldPwd: "",
					newPwd: ""
				},
				formOptions: [{
					title: "旧密码",
					field: "oldPwd",
					type: "password",
					required: true
				}, {
					title: "新密码",
					field: "newPwd",
					type: "password",
					required: true
				}]
			}
		},
		methods: {
			submit() {
				if (!this.$refs.form.validate()) {
					return;
				}

				let url = "api/user/modifyPwd?oldPwd=" +
					this.formFields.oldPwd +
					"&newPwd=" +
					this.formFields.newPwd;
				this.http.post(url, {}, true).then(x => {
					this.$toast(x.message);
					if (!x.status) {
						return;
					};
					// uni.switchTab({
					// 	url: '/pages/user/user'
					// })
				});
			}
		}
	}
</script>

<style lang="less" scoped>
	.md-form {
		padding: 60rpx 20rpx 0 20rpx;
	}
</style>
