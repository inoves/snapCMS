<div id="logo">
	
</div>

<div id="head">
	<S if $session.user_id S>
		<!--div id="navegator">
			<span> Go to list of: </span>
			<select onchange="location='<S $helper->url('tracks/campaigns/') S>'+$F('select_sites');" id="select_sites" class="title">
				<S foreach from=$menu_top item=item S>
					<option value="<S$itemS>" <S if $item eq $cookie.site S>
					selected
					<S/ifS>
					><S$itemS></options>
				<S/foreachS>
			</select>
		</div-->
		<div id="wellcome">Welcome <S $user->name S> - <S $helper->link_to("Logoff", "home/logoff", ' style=" color:#fff; "')S></div>
	<S /if S>
</div>