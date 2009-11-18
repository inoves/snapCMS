<div class="report">
	<h1>Campaign: <S $campaign->name S></h1>
	
	<div>
		<p>Description:  <S $campaign->description S></p>
		<p>Site name:  <S $site->name S></p>
		<p>Created at:  <S $campaign->created_at S></p>
		<p>Count:  <S $count S></p>
		<p>Newsletter image tag: &lt;img src=&quot;http://<S $server.SERVER_NAME S><S $helper->url('hits/') S><S $campaign->id S>/<S $site->tag_email S>&quot; /&gt;</p>
		
	</div>
	
	<div id="container" style="width:700px;height:300px;"></div>
	
</div>


<!--Data chart-->
<script>
	var data = [{
	    data: [ <S $data S> ],
	    lines: {show: true, fill: true}, points: {show: true}
	}];
	
	var options = { 
		xaxis: { ticks: [ <S $xaxis S> ], noTicks:30 },
		selection: {
			mode: 'x',
			color: '#B6D9FF',
			fps: 10	
		},
		grid: {
			backgroundColor: '#FFFFFF'
		}
	};
	Flotr.draw($('container'), data, options);
</script>