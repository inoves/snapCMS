<script>
	function validate_twitter(){
		var t = $("txtarea_twitter");
		$("label_tw").innerHTML = 140 - t.val().length;
		if($F("txtarea_twitter").length > 140){
			t.value = t.value.substring(0,140);
		}
		$("label_tw").innerHTML = 140 - t.val().length;
		return true;
	}
</script>
<!--
	List my twitters
-->
<br/><br/>

<div>
	<form action="<S $helper->url('admin/new_twitter') S>" method="POST" class="form_twitter" id="form_twitter" onsubmit="return validate_twitter();">
		<div>
			<span class="h1">New twitter</span> <span class="h3 cinza" id="label_tw">140</span><br><br>
			<textarea name="message" rows="3" class="txtarea" id="txtarea_twitter" onkeyup="validate_twitter()"></textarea><br>
		</div>
		<div class="clear"></div>
		<div><input type="submit" value="Submit" class="submit"> Send your twitter!</div>
		
		<div class="clear"></div>
	</form>
	<br/>
	
	<div class="clear"></div>
	<span class="h1">My Twitters</span> (<a href="javascript:void(0);" class="a" onclick="">Create Twitter</a>)<br/><br/>
	<ol>
	<S foreach from=$my_twitters_xml->status item=twtt S>
		<li class="twitter">
			<h2>
				<a href="<S $helper->url('admin/remove_twitter/') S><S $twtt->id S>" onclick="if(!confirm('You are sure?')) return false;"><S $helper->img('bin.png') S></a>
				<S $twtt->text S>
			</h2>
			<span>Created at: <S $twtt->created_at S></span>
		</li>
	<S/foreach S>
	</ol>
</div>


<br/><br/><br/>

<span class="h1">My Twitters friends</span><br/><br/>
<div class="clearfix myborder mypadding10">

	<S foreach from=$my_friends_xml->user item=twtt S>
		<div class="grid_2" align="center">
			<a href="http://www.twitter.com/<S $twtt->screen_name S>"><img src="<S $twtt->profile_image_url S>" width="50"></a><br>
				<S $twtt->screen_name S>
				<br/><br/><br/>
		</div>
	<S/foreach S>
	
</div>

<br/><br/><br/>

	<div class="clear"></div>
	<span class="h1">Replies</span><br/><br/>
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

