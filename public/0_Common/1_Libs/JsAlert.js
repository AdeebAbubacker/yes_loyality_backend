class JsAlert {
	constructor(elem, options = []) {
		this.defaultOptions = {
			message: "JsAlert Init Success!",
			type: "success!",
			timeout: 0,
			
			removeClassPrefix: "alert-",
			
			newClassPrefix: "alert-",
			
			messageWrap: null,

			// 
			// messageWrap Structure if not null!
			// 
			// messageWrap: {
			// 	html: null,
			// 	alertWrapId: null,
			// },
			// 

			HideCss: "display:none;",
			ShowCss: "display:block;",
			
			alertTypeClasses: {
				"success": "success",
				"error": "danger",
				"warning": "warning",
				"info": "info",
			},
        };

		this.options = { ...this.defaultOptions, ...options };
		
		// console.log(`1. ${elem}, ${domElem}\nLine 46 - Before assigning domElem`);

		var domElem = (this.options.messageWrap == null) ? null : document.querySelector(elem);

		if(!document.querySelector(elem)) {
			console.error(`${elem} not found in DOM!`);
			return false;
		}

		// console.log(`2. ${elem}, ${domElem}\nLine 52 - After assigning domElem`);

		return this.process(
			elem,
			domElem,
			this.options.message,
			this.options.type,
		);
	}

	process(elem, domElem, message, type) {
		var newClass = this.options.newClassPrefix + this.options.alertTypeClasses[type];
		var HideCss = this.options.HideCss;
		var ShowCss = this.options.ShowCss;

		// console.log(`3. ${elem}, ${domElem}\nLine 67 - Before calling renderMessageWrap()`);

		var renderedDomElem = this.renderMessageWrap(elem, domElem);

		// console.log(`5. ${elem}, ${domElem}\nLine 71 - After calling renderMessageWrap()`);

		// console.log(domElem);
		
		domElem = (renderedDomElem) ? renderedDomElem : document.querySelector(elem);

		// console.log(`6. ${elem}, ${domElem}\nLine 79 - After assigning domElem to elem if(!messageWrap)`);

		domElem.style.cssText += HideCss;

		this.removeClassStarting(domElem, this.options.removeClassPrefix);
		this.addClass(domElem, newClass);

		// if(renderedDomElem) {
		// 	var alertWrapId = this.options.messageWrap.alertWrapId ?? "#MainAlert";
		// }
		// else {
		// 	var alertWrapId = elem;
		// }

		domElem.innerHTML = message;
		
		domElem.style.cssText += ShowCss

		if(this.options.timeout) {
			window.setTimeout(function() {
				domElem.style.cssText += HideCss;
			}, this.options.timeout, domElem);
		}
	}

	renderMessageWrap(elem, domElem) {
		var messageWrap = this.options.messageWrap;

		if(messageWrap == null) {
			// console.log("no messageWrap");
			return false;
		}
		
		// console.log(`4. ${elem}, ${domElem}\nLine 101 - Inside renderMessageWrap()`);
		
		messageWrap = this.options.messageWrap;
		var alertWrapId = this.options.messageWrap.alertWrapId ?? "MainAlert";
		
		// console.log(messageWrap);
		
		// alertWrapId

		if(messageWrap != null && messageWrap.html == null) {
			messageWrap = `<div class="alert alert-success" id="MainAlert">Message</div>`
		}

		var docFrag = document.createDocumentFragment();
		var tempDiv = document.createElement('div');

		tempDiv.innerHTML = messageWrap.html;

		while (tempDiv.firstChild) {
			docFrag.appendChild(tempDiv.firstChild);
		}

		// docFrag.style.cssText = this.options.HideCss;

		domElem.appendChild(docFrag);

		// console.log(document.querySelector(alertWrapId));

		domElem = document.querySelector(alertWrapId);
		domElem.style.cssText = this.options.HideCss;

		return domElem;
	}

	changeClass(domElem, changeFrom, changeTo) {
		this.removeClassStarting(domElem, changeFrom);
		this.addClass(changeTo);
	}

	removeClassStarting(domElem, string) {
		for (let i = domElem.classList.length - 1; i >= 0; i--) {
			if (domElem.classList[i].startsWith(string)) {
				domElem.classList.remove(domElem.classList[i]);
			}
		}
	}

	addClass(domElem, string) {
		domElem.classList.add(string);
	}
	

}


// new JsAlert("#MainAlert", {
//     message: "Your custom message 1",
//     type: "error", // or "error", "warning", "info"
//     timeout: 5000, // Time in milliseconds, 0 for no timeout
// });

// new JsAlert("#MainAlertWrap", {
//     message: "Your custom message",
//     type: "error", // or "error", "warning", "info"
//     timeout: 5000, // Time in milliseconds, 0 for no timeout
// 	messageWrap: {
// 		html: `<div class="alert alert-success" id="MainAlert2"></div>`,
// 		alertWrapId: '#MainAlert2',
// 	},
// });
