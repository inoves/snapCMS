<script>
	function validated_twitter(){
		var t = $("txtarea_twitter");
		$("label_tw").update( 140 - t.value.length);
		if($F("txtarea_twitter").length > 140){
			t.value = t.value.substring(0,140);
		}
		$("label_tw").update( 140 - t.value.length);
		return true;
	}
</script>


<div class="grid_9">

	
	<div class="content_main">

			<form method="POST" class="form_twitter" id="form_twitter" onsubmit="return validate_twitter();">
				<div>
					<h1>New twitter <span class="h3 cinza" id="label_tw">140</span></h1>
				<div class="content">
					<textarea name="message" rows="3" class="txtarea" id="txtarea_twitter" onkeyup="validated_twitter()"></textarea><br>


				<div><input type="submit" value="Submit" class="submit"> Send your twitter!</div>
		
				</div>
			</form>
			
			
			<h1>My Twitters</h1>
			<div class="content">
			<ol>
			<S foreach from=$my_twitters_xml->status item=twtt S>
				<li class="twitter">
					<h5>
						<a href="<S $helper->url('admin/twitter/remove/') S><S $twtt->id S>" onclick="if(!confirm('You are sure?')) return false;"><S $helper->img('/images/bin.png') S></a>
						<S $twtt->text S>
					</h5>
					<span>Created at: <S $twtt->created_at S></span>
				</li>
			<S/foreach S>
			</ol>
		</div>

		<h1>My Twitters friends</h1><br/><br/>
		<div class="content">
			<S foreach from=$my_friends_xml item=twtt S>
				<div class="grid_2" align="center">
					<a href="http://www.twitter.com/<S $twtt->screen_name S>"><img src="<S $twtt->profile_image_url S>" width="50"></a><br>
						<S $twtt->screen_name S>
						<br/><br/><br/>

				</div>
			<S/foreach S>
		</div>

		<br/><br/><br/>

			<div class="clear"></div>
			<h1>Replies</h1>
			<div class="content">
			<ol>
			<S foreach from=$my_replies_xml->status item=twtt S>
				<li class="twitter clearfix">
					<div class="grid_1">
						<a href="http://www.twitter.com/<S $twtt->user[0]->screen_name S>">
							<img src="<S $twtt->user[0]->profile_image_url S>">
						</a>
					</div>
					<div class="grid_7">
						<span class="h3">
							<S $twtt->text S>
						</span>
						<br/>
						<span>Created at: <S $twtt->created_at S></span>
					</div>
				</li>
			<S/foreach S>
			</ol>
			</div>

</div>
</div>