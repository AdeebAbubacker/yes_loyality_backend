class JsApi {
	constructor(apiUrl, options = []) {
		this.settigs = {
			baseUrl: "https://volunteer.cyberfort.co.in/api",
			isFormSubmision: 0,
			needJsonResponse: 1,
			JsApiFormat: 1,
		};

		console.log("apiUrl : " + apiUrl);
		
		if(typeof apiUrl === 'object' && apiUrl !== null) {
			this.authSettigs = apiUrl;
			return false;
		}
		else {
			this.authSettigs = {
				userName: "",
				password: "",
			};
		}
		this.defaultOptions = {
            baseUrl: "",
            isFormSubmision: 0,

            form: "", // #JsApiForm

            data: {
                params: {}, // Gets serialized into the url
                formData: {},
                formAppend: {},
            },

            isFullUrl: 0,
            processJson: 1,

            method: "GET",
            type: "UrlEncoded", // FormData, UrlEncoded, Raw
            contentType: "",

            headers: {
                Accept: "*/*",
                UserAgent: "JsApi Plugin (https://www.cyberforttech.com)",
                CacheControl: "JsApi Plugin (https://www.cyberforttech.com)",
                ContentType: "JsApi Plugin (https://www.cyberforttech.com)",
                AcceptEncoding: "JsApi Plugin (https://www.cyberforttech.com)",
                Connection: "JsApi Plugin (https://www.cyberforttech.com)", // Connection
                "Access-Control-Allow-Origin": true,
            },
            authType: "none",
            authInfo: {
                token: "",

                userName: "",
                password: "",

                apiKey: "",
                apiKeyVal: "",

                keyWithUrl: 0,
            },

            alert: "",
            callbacks: {
                onSuccess: "",
                onFailure: "",
            },
            statusCodes: {
                0: "Failed",
                1: "Success",
            },
            responseCodes: ["Success", "Error", "Database Error", "404"],
        };

		var allOptions = { ...this.defaultOptions, ...options };
		// var authSettigs = { ...this.authSettigs, ...authSettigs };

		this.options = allOptions;

		if(this.options.isFullUrl) {
			this.apiFullUrl = this.apiUrl;
		}
		else {
			this.apiUrl = apiUrl;
			this.apiFullUrl =
                (this.options.baseUrl !== "") ? this.options.baseUrl : this.settigs.baseUrl;
			this.apiFullUrl = this.apiFullUrl + this.apiUrl;
		}

		this.thisForm = document.querySelector(this.options.form);

		this.formData = this.headers = "";

		this.values = this.requestOptions = [];
		this.acceptedAuthTypes = ["apiKey", "bearerToken", "basicAuth"];

		if (this.thisForm === null || this.options.form == "") {
			this.thisForm = "";
			this.options.data.formData = this.options.data.formAppend = {};
			this.settigs.isFormSubmision = 0;
		}

		return this.sendApi();
	}

	async sendApi() {
		this.getFormData();

		this.headers = new Headers();
		this.addHeaders(this.options.headers);

		if (this.acceptedAuthTypes.indexOf(this.options.authType) != -1) {
			this.addApiAuth();
		}

		var params = this.serialize(this.options.data.params);

		var url = this.apiFullUrl;
		if (params != "") url += "?" + params;

		this.requestOptions = {
			method: this.options.method.toUpperCase(),
			headers: this.headers,
			redirect: "follow",
		};

		if (this.options.method.toUpperCase().indexOf(["GET", "HEAD"]) != -1) {
			this.requestOptions.body = this.formData;
		}

		var responseData = fetch(url, this.requestOptions)
			.then((response) => response.text())
			.then((response) => {
				if(processJson) JSON.parse(response);
				this.options.callbacks.onSuccess(response);
			})
			.catch((error) => {
				if(processJson) JSON.parse(error);
				console.log("error", error);
				this.options.callbacks.onFailure(error);
			});

		// console.log(responseData);
		// postData("https://example.com/answer", { answer: 42 }).then((data) => {
		// 	console.log(data); // JSON data parsed by `data.json()` call
		// });
	}
	// Example POST method implementation:
	async postData(url = "", data = {}) {
		// Default options are marked with *
		const response = await fetch(url, {
			method: "POST", // *GET, POST, PUT, DELETE, etc.
			mode: "cors", // no-cors, *cors, same-origin
			cache: "no-cache", // *default, no-cache, reload, force-cache, only-if-cached
			credentials: "same-origin", // include, *same-origin, omit
			headers: {
				"Content-Type": "application/json",
				// 'Content-Type': 'application/x-www-form-urlencoded',
			},
			redirect: "follow", // manual, *follow, error
			referrerPolicy: "no-referrer", // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
			body: JSON.stringify(data), // body data type must match "Content-Type" header
		});
		return response.json(); // parses JSON response into native JavaScript objects
	}

	addHeaders(headers) {
		if (Object.keys(headers).length !== 0) {
			Object.keys(headers).forEach((key, val) => {
				this.headers.append(key, val);
			});
		}
	}

	addApiAuth() {
		switch (options.authType) {
			case "apiKey":
				if (options.authInfo.keyWithUrl == 1) {
					options.data.params.apiKey = options.authInfo.apiKeyVal;
				} else {
					this.addHeaders([
						options.authInfo.apiKey,
						options.authInfo.apiKeyVal,
					]);
				}
				break;

			case "bearerToken":
				this.addHeaders(["Authorization", "Bearer " + options.authInfo.token]);
				break;

			case "basicAuth":
				var credential = btoa(
					options.authInfo.password + "," + options.authInfo.password
				);
				this.addHeaders(["Authorization", "Basic " + credential]);
				break;
		}
	}

	getFormData() {
		if (this.options.type == "formData") {
			this.formData = new FormData(form);
		} else if (this.options.type == "urlencoded") {
			this.formData = new URLSearchParams(form);
		}
		// else if (this.options.type == "rawJson") {
		// 	this.formData = new URLSearchParams(form);
		// }

		if (this.settigs.isFormSubmision == 1) {
			this.thisForm.addEventListener("submit", (e) => {
				// prevent the form from submitting
				e.preventDefault();

				for (const pair of this.formData) {
					this.formData.append(pair[0], pair[1]);
				}
			});
		}

		// console.log(this.options.data.formAppend.length);

		if (Object.keys(this.options.data.formAppend).length === 0) {
			this.formData = this.options.data.formAppend;
		} else {
			Object.keys(this.options.data.formAppend).forEach((key, val) => {
				this.formData.append(key, val);
			});
		}

		return this.formData;
	}

	serialize(params) {
		var str = [];

		for (var p in params) {
			if (params.hasOwnProperty(p)) {
				str.push(encodeURIComponent(p) + "=" + encodeURIComponent(params[p]));
			}
		}

		return str.join("&");
	}

	getFiles() {
		// Empty //
	}

	formDataToArray(formData) {
		return formData.getAll();
	} // No Need //

	formDataToJson(formData) {
		return JSON.stringify(formData);
	} // No Need //

	validateParams() {
		// Empty //
	}
}
