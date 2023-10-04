<script>
	export default {
		onLaunch: function() {
			console.log('App Launch')
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>

<style>
	/*每个页面公共css */
	.u-tabbar>.u-tabbar__content {
		padding-bottom: 10rpx;
		border-top: 1px solid #eee;
	}

	/* 	.u-popup .u-fade-enter-active{
		    z-index: 999999 !important;
	} */
	uni-toast {
		z-index: 99999999 !important;
	}

	uni-page-body,
	html,
	body {
		height: 100%;
	}

	uni-page-body>uni-view:first-child {
		height: 100%;
	}

	.sort-form-popup .u-fade-enter-to {
		z-index: 9999999 !important;
	}

	.u-button {
		border-color: unset !important;
		border-width: 0 !important;
	}

	/* 	.grid-u-model>.u-transition {
		z-index: 99999999 !important;
	} */
	.grid-u-model .u-transition {
		z-index: 99999999 !important;
	}

	// #ifdef MP-WEIXIN
	page {
		height: 100%;
	}

	page>view:first-child {
		height: 100%;
	}

	// #endif

	.vol-action-sheet-select-container {
		min-height: 200rpx;
		display: flex;
		flex-direction: column;
	}

	.vol-action-sheet-select-container .vol-action-sheet-select-title {
		padding: 24rpx;
		text-align: center;
		position: relative;
		border-bottom: 1px solid rgb(233 233 233);

	}

	.vol-action-sheet-select-container .vol-action-sheet-select-title .vol-action-sheet-select-confirm {
		position: absolute;
		right: 30rpx;
		color: #007AFF;
		font-weight: 500;
	}

	.vol-action-sheet-select-container .vol-action-sheet-select-content {
		flex: 1;
		height: 0;
		overflow: scroll;
	}

	.u-popup .u-transition {
		z-index: 99999999 !important;
	}

	.f-form-content-group .u-radio-group {
		justify-content: flex-end !important;
	}
</style>
