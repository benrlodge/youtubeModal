##A jQuery Modal plugin for youtube videos.


### How to use: 


Since the modal is activate by a link, set an id on that link, add the youtube id to the data-id attribute, then set the id of the link to the youtubeModal() plugin. That's all you need to get started.


Example: 

```html

<a href="#" id="video" data-id="xEhaVhta7sI">Click Me, I dare ya. I double dog dare ya.</a>

```

```javascript

	$(document).ready(function(){
		
		$('#video').youtubeModal({
			width: '80%'
		});

	})


```

Options:

```javascript
		
		$('#video').youtubeModal({
			width: '80%',	// any size
			autoplay: true	// true || false
		});


```