<div class="report">
<h1>New Campaign</h1>
	
	<form action="" method="post" onsubmit="validated_form(this)" id="form_new_campaign">
		<span id="msg"></span>
		<p>
			Name:<br/>
			<input name="name" type="text" class="title" value="<S $post.name S>" id="name"/>
		</p>
		<p>
			Description:<br/>
			<input name="description" type="text" class="title" value="<S $post.description S>" id="description"/>
		</p>
		<p>
			Site:<br/>
			<select class="title" name="site_id" id="site_id">
				<S foreach from=$sites item=item S>
					<option value="<S$item->idS>"><S $item->name S></options>
				<S/foreachS>
			</select>
		</p>
		<p><input type="submit" /></p>
		<p><br/></p>
		<p><br/></p>
	</form>
	
</div>

<script>
	$('form_new_campaign').onsubmit = function(){
	  var valid, msg = $('msg')
	  // are both fields present?
	  valid = $(this.name).present() && $(this.description).present()
	
	  if (valid) {
	    return true
	  } else {
	    msg.update('Please fill out all the fields.').style.color = 'red'
	  }
	  return false
	}
</script>