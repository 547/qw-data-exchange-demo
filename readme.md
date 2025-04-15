# qw-data-exchange 使用示例
```
<script>
	// 导入要使用的插件
	import { DataExchangeApiOptions, postData, listen, DataListener } from "@/uni_modules/qw-data-exchange";

	export default {
		data() {
			return {
				title: 'title',
				test: '',
				dataListeners: [] as DataListener[],
			}
		},
		onLoad() {
			console.debug('onLoad')
			// 添加监听
			const listener1 = listen("nativeTest", (data : Map<string, any>) => {
				console.log('test收到数据:', data)
				this.title = data["title"]
			})
			const listener2 = listen("uniappTest", (data : Map<string, any>) => {
				console.log('test收到数据:', data)
				this.test = data["title"]
			})
			this.dataListeners = [listener1, listener2]
		},
		onUnload() {
			this.dataListeners.forEach(element => {
				// 移除监听
				element.removeListener()
			});
		},
		methods: {
			clickTestButton1() {
				// 发送数据
				let options = {
					name: "nativeTest",
					data: {
						"title": "11111",
					},
				} as DataExchangeApiOptions;
				postData(options)
			},
			clickTestButton2() {
				let options = {
					name: "uniappTest",
					data: {
						"title": "1233",
					},
				} as DataExchangeApiOptions;
				postData(options)
			},
			clickTestButton3() {
				let options = {
					name: "nativeData",
					data: {
						"title": "1233",
					},
				} as DataExchangeApiOptions;
				postData(options)
			},
		}
	}
</script>
```