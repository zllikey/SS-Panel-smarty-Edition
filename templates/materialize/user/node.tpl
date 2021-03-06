<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>节点列表 -<{$site_name}></title>
<{include file='user/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点列表&nbsp;<small>Node List</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>请根据本地网络环境，寻找适合自己的节点。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading"><i class="icon icon-lg">cloud_queue</i>&nbsp;普通节点</p>
								<div class="card card-red">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading"><i class="icon icon-lg">warning</i>&nbsp;注意事项<small>Attention</small></p>
											<p><{$notice->notice('common_node')}></p>
										</div>
									</div>
								</div>
								<{if $oo->get_enable()==0 || $oo->get_enable()==3}>
									<div class="card card-red">
										<div class="card-main">
											<div class="card-inner">
												<p class="card-heading">账户异常<small>Error</small></p>
												<p>你的账号状态为：停止，请查看用户中心。</p>
											</div>
										</div>
									</div>
								<{else}>
									<{if $plan==A}>
										<div class="card card-green">
											<div class="card-main">
												<div class="card-inner">
													<p><i class="icon icon-lg">lightbulb_outline</i>&nbsp;立即成为高级用户，使用全部高速节点。&nbsp;&nbsp;<a class="btn btn-brand-accent waves-attach waves-light" href="#buy" data-toggle="modal"><i class="icon icon-lg">credit_card</i>&nbsp;我要装逼</a></p>
												</div>
											</div>
										</div>
									<{/if}>
									<{foreach $node0 as $row}>
										<h2 class="content-sub-heading"><i class="icon icon-lg">cloud_circle</i><{$row['node_name']}></h2>
										<div class="card">
											<div class="card-main">
												<div class="card-inner">
													<{$row['node_info']}>
												</div>
												<div class="card-action">
													<ul class="nav nav-list margin-no pull-left">
														<li class="dropdown">
															<a href="javascript:void(0)" class="dropdown-toggle text-black waves-attach" data-toggle="dropdown"><i class="icon icon-lg">network_wifi</i>&nbsp;详细信息</a>
															<ul class="dropdown-menu">
																<li>
																    <a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">location_on</i>&nbsp;伺服器地址：<{$row['node_server']}></a>
																</li>
																<li>
																    <a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">device_hub</i>&nbsp;伺服器状态：<{$row['node_status']}></a>
																</li>
																<li>
																    <a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">security</i>&nbsp;加密方式：<{$row['node_method']}></a>
																</li>
																<li>
																    <a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">lock_outline</i>&nbsp;SSR（空白为原版）：<{$row['protocol']}>/<{$row['obfs']}>/<{$row['parameter']}></a>
																</li>
															</ul>
														</li>
													</ul>
													<ul class="nav nav-list margin-no pull-left">
														<li>
															<a href="javascript:void(0)" class='dropdown-toggle text-black waves-attach'><i class="icon icon-lg">import_export</i><span class="ping" id="<{$row['id']}>_ping" value="<{$row['node_server']}>">Ping</span></a>
														</li>
													</ul>
													<ul class="nav nav-list margin-no pull-right">
														<a href="javascript:void(0)" class="dropdown-toggle text-black waves-attach getqrcode" value="<{$row['qr']}>"><i class="icon icon-lg">blur_on</i>二维码</a>
													</ul>
												</div>
												<div class="card-action text-center" style="min-height:15px;">
													<div class="col-lg-3 col-md-3 col-sm-3 col-xl-3"><small><i class="icon icon-lg">data_usage</i>&nbsp;负载:&nbsp;<span id="<{$row['id']}>_load"><{$row['load_1']}></span></small></div>
													<div class="col-lg-3 col-md-3 col-sm-3 col-xl-3"><small><i class="icon icon-lg">graphic_eq</i>&nbsp;CPU:&nbsp;<span id="<{$row['id']}>_cpu"><{$row['cpu']}></span></small></div>
													<div class="col-lg-3 col-md-3 col-sm-3 col-xl-3"><small><i class="icon icon-lg">trending_up</i>&nbsp;上行:&nbsp;<span id="<{$row['id']}>_upload"><{$row['upload']}></span></small></div>
													<div class="col-lg-3 col-md-3 col-sm-3 col-xl-3"><small><i class="icon icon-lg">trending_down</i>&nbsp;下行:&nbsp;<span id="<{$row['id']}>_download"><{$row['download']}></span></small></div>
												</div>
											</div>
										</div>
									<{/foreach}>
								<{/if}>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading"><i class="icon icon-lg">cloud_queue</i>&nbsp;高级节点</p>
								<div class="card card-red">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading"><i class="icon icon-lg">warning</i>&nbsp;注意事项<small>Attention</small></p>
											<p><{$notice->notice('special_node')}></p>
										</div>
									</div>
								</div>
								<{if $oo->get_enable()==0 || $oo->get_enable()==3}>
									<div class="card card-red">
										<div class="card-main">
											<div class="card-inner">
												<p class="card-heading">账户异常<small>Error</small></p>
												<p>你的账号状态为：停止，请查看用户中心。</p>
											</div>
										</div>
									</div>
								<{else}>
									<{if $plan>'C'}>
										<div class="card card-green">
											<div class="card-main">
												<div class="card-inner">
													<p><{$GetUserName}>&nbsp;, 您是高级账户持有者，您可以使用任意的<{$site_name}>节点，玩的愉快：-）</p>
												</div>
											</div>
										</div>
										<{foreach $node1 as $row}>
											<h2 class="content-sub-heading"><i class="icon icon-lg">cloud_circle</i><{$row['node_name']}></h2>
											<div class="card">
												<div class="card-main">
													<div class="card-inner">
														<{$row['node_info']}>
													</div>
													<div class="card-action">
														<ul class="nav nav-list margin-no pull-left">
															<li class="dropdown">
																<a class="dropdown-toggle text-black waves-attach" data-toggle="dropdown"><i class="icon icon-lg">network_wifi</i>&nbsp;详细信息</a>
																<ul class="dropdown-menu">
																	<li>
																		<a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">location_on</i>&nbsp;伺服器地址：<{$row['node_server']}></a>
																	</li>
																	<li>
																		<a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">device_hub</i>&nbsp;伺服器状态：<{$row['node_status']}></a>
																	</li>
																	<li>
																		<a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">security</i>&nbsp;伺服器加密方式：<{$row['node_method']}></a>
																	</li>
															        	<li>
															        	     <a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">lock_outline</i>&nbsp;SSR（空白为原版）：<{$row['protocol']}>/<{$row['obfs']}>/<{$row['parameter']}></a>
														        		</li>
																</ul>
															</li>
														</ul>
														<ul class="nav nav-list margin-no pull-left">
															<li>
																<a href="javascript:void(0)" class='dropdown-toggle text-black waves-attach'><i class="icon icon-lg">import_export</i><span class="ping" id="<{$row['id']}>_ping" value="<{$row['node_server']}>">Ping</span></a>
															</li>
														</ul>
														<ul class="nav nav-list margin-no pull-right">
															<a href="javascript:void(0)" class="dropdown-toggle text-black waves-attach getqrcode" value="<{$row['qr']}>"><i class="icon icon-lg">blur_on</i>二维码</a>
														</ul>
													</div>
													<div class="card-action text-center" style="min-height:15px;">
														<div class="col-lg-3 col-md-3 col-sm-6 col-xl-12"><small><i class="icon icon-lg">data_usage</i>&nbsp;负载:&nbsp;<span id="<{$row['id']}>_load"><{$row['load_1']}></span></small></div>
														<div class="col-lg-3 col-md-3 col-sm-6 col-xl-12"><small><i class="icon icon-lg">graphic_eq</i>&nbsp;CPU:&nbsp;<span id="<{$row['id']}>_cpu"><{$row['cpu']}></span></small></div>
														<div class="col-lg-3 col-md-3 col-sm-6 col-xl-12"><small><i class="icon icon-lg">trending_up</i>&nbsp;上行:&nbsp;<span id="<{$row['id']}>_upload"><{$row['upload']}></span></small></div>
														<div class="col-lg-3 col-md-3 col-sm-6 col-xl-12"><small><i class="icon icon-lg">trending_down</i>&nbsp;下行:&nbsp;<span id="<{$row['id']}>_download"><{$row['download']}></span></small></div>
													</div>
												</div>
											</div>
										<{/foreach}>
									<{else}>
										<div class="card card-green">
											<div class="card-main">
												<div class="card-inner">
													<p><i class="icon icon-lg">lightbulb_outline</i>立即成为高级用户，使用全部高速节点。&nbsp;&nbsp;<a class="btn btn-brand-accent waves-attach waves-light" href="#buy" data-toggle="modal"><i class="icon icon-lg">credit_card</i>&nbsp;我要装逼</a></p>
												</div>
											</div>
										</div>
										<{foreach $node1 as $row}>
											<h2 class="content-sub-heading"><i class="icon icon-lg">cloud_circle</i><{$row['node_name']}></h2>
											<div class="card">
												<div class="card-main">
													<div class="card-inner">
														<{$row['node_info']}>
													</div>
													<div class="card-action">
														<ul class="nav nav-list margin-no pull-left">
															<li class="dropdown">
																<a class="dropdown-toggle text-black waves-attach" data-toggle="dropdown"><i class="icon icon-lg">network_wifi</i>&nbsp;详细信息</a>
																<ul class="dropdown-menu">
																	<li>
																		<a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">location_on</i>&nbsp;伺服器地址：<i class="icon icon-lg">visibility_off</i></a>
																	</li>
																	<li>
																		<a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">device_hub</i>&nbsp;伺服器状态：<i class="icon icon-lg">visibility_off</i></a>
																	</li>
																	<li>
																		<a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">security</i>&nbsp;伺服器加密方式：<i class="icon icon-lg">visibility_off</i></a>
																	</li>
															        	<li>
															        	     <a class="waves-attach" href="javascript:void(0)"><i class="icon icon-lg">lock_outline</i>&nbsp;SSR（空白为原版）：<i class="icon icon-lg">visibility_off</i></a>
															        	</li>
																</ul>
															</li>
														</ul>
														<{if $plan == 'E' or $plan == 'D'}>
														<ul class="nav nav-list margin-no pull-left">
															<li>
																<a href="javascript:void(0)" class='dropdown-toggle text-black waves-attach'><i class="icon icon-lg">import_export</i><span class="ping" id="<{$row['id']}>_ping" value="<{$row['node_server']}>">Ping</span></a>
															</li>
														</ul>
														<{/if}>
														<ul class="nav nav-list margin-no pull-right">
															<li class="dropdown">
																<a href="#buy" class="dropdown-toggle text-black waves-attach" data-toggle="modal"><i class="icon icon-lg">next_week</i>&nbsp;支付</a>
															</li>
														</ul>
													</div>
													<div class="card-action text-center" style="min-height:15px;">
														<div class="col-lg-3 col-md-3 col-sm-6 col-xl-12"><small><i class="icon icon-lg">data_usage</i>&nbsp;负载:&nbsp;<span id="<{$row['id']}>_load"><{$row['load_1']}></span></small></div>
														<div class="col-lg-3 col-md-3 col-sm-6 col-xl-12"><small><i class="icon icon-lg">graphic_eq</i>&nbsp;CPU:&nbsp;<span id="<{$row['id']}>_cpu"><{$row['cpu']}></span></small></div>
														<div class="col-lg-3 col-md-3 col-sm-6 col-xl-12"><small><i class="icon icon-lg">trending_up</i>&nbsp;上行:&nbsp;<span id="<{$row['id']}>_upload"><{$row['upload']}></span></small></div>
														<div class="col-lg-3 col-md-3 col-sm-6 col-xl-12"><small><i class="icon icon-lg">trending_down</i>&nbsp;下行:&nbsp;<span id="<{$row['id']}>_download"><{$row['download']}></span></small></div>
													</div>
												</div>
											</div>
										<{/foreach}>
										<div aria-hidden="true" class="modal modal-va-middle fade" id="buy"  role="dialog" tabindex="-1" >
											<div class="modal-dialog modal-xs">
												<div class="modal-content">
													<div class="modal-inner">
														<div class="text-center">
															<h1 class="h1 margin-top-sm" id="msg">开通高级节点</h1>
															<div class="form-group form-group-label">
																<label class="floating-label" for="code">输入您的兑换码</label>
																<input class="form-control" id="code" name="code" maxlength="30" required>
																<p>&nbsp;</p>
																<button data-toggle="modal" class="btn btn-block btn-brand-accent waves-attach waves-light"  id='test'>提交并检查兑换码</button>
																<button data-toggle="modal" class="btn btn-block btn-brand waves-attach waves-light"  id='exchange' style="display:none;">兑换</button>
																<p>没有兑换码？</p>
																<a href="shop.php" target="_blank" class="btn btn-block btn-brand waves-attach waves-light" >购买！</a>
															</div>
															<p><id="info"></p>
															<{include file="loading.tpl"}>
														</div>
													</div>
												</div>
											</div>
										</div>
									<{/if}>
								<{/if}>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
</body>
<div aria-hidden="true" class="modal modal-va-middle fade" id="node_qr" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title"></p>
			</div>
			<div class="text-center">
				<div class="modal-inner" id="qrcode"></div>
			</div>
		</div>
	</div>
</div>
<{include file='../footer.tpl'}>

<script src="<{$resources_dir}>/js/ping.js"></script>
<script>
var ping_id=0;
p = new Ping();
    $('.ping').click(function(){
        ping_id = $(this).attr('id');
        url = 'http://'+$(this).attr('value');
        ping_result(ping_id, url)
        })
    
    function ping_result(ping_id, url){
        p.ping(url, function(data){
            if ($('#'+ping_id).html() == 'Ping')
                {
                    $('#'+ping_id).html('请稍后');
                    ping_result(ping_id, url);
                }
            else
                $('#'+ping_id).html(data+'ms')
            })
        }
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $("#test").click(function(){
        $("#loading").show();
        $("#test").hide();
        $("#info").html("");
        $.get('_code.php',{method:"test",code:$('#code').val()},
            function(data){
                $("#info").html(data['info']);
                $("#loading").hide();
                if (data['status'] == 'success'){
                    $("#exchange").show();
                    $("#test").hide();
                }
                else{
                    $("#info").html(data['info']);
                    $("#test").show();
                    $("#exchange").hide();
                }
        },'json')
        })
    })
    $('#exchange').click(function(){
        $("#loading").show();
        $("#info").html(" ");
        $.get('_code.php',{'method':'redeem', code:$('#code').val()},
        function(data){
                $("#info").html(data['info']);
                $("#loading").hide();
                if(data['status'] == 'success'){
                $("#info").html(data['info']);
                $("#test").show();
                $("#exchange").hide();
                document.getElementById("code").value="";
                $("#test").html("提交并检查新的兑换码");
                }
                else{
                $("#info").html(data['info']);
                }
            },'json'
        )
    });
    
    $('#code').change(function(){
        $("#info").html("");
        $("#loading").hide();
        $("#test").show();
        $("#exchange").hide();
    });
    
    $('.getqrcode').click(function(){
        ssurl=$(this).attr('value');
        $('#qrcode').html('<img src="../code/api.php?text='+ssurl+'" height="250px" width ="250px"\>');
        $('#node_qr').modal();
        });
</script>
<script type="text/javascript">
    $(document).ready(function(){
    
        setTimeout(get_node_info,3000);
    })
    
    function get_node_info(){
        $.ajax({
            type:"POST",
            url:"nodeinfo.php",
            dataType:"json",
            data:{},
            success: function (response, xml) {

                 response.forEach(function(e){
                    
                    $('#'+e['node_id']+'_load').html(e['load_1']==null?'<s>无数据</s>':e['load_1'])
                    $('#'+e['node_id']+'_cpu').html(e['cpu']==null?'<s>无数据</s>':e['cpu'])
                    $('#'+e['node_id']+'_upload').html(e['upload']==null?'<s>无数据</s>':e['upload'])
                    $('#'+e['node_id']+'_download').html(e['download']==null?'<s>无数据</s>':e['download'])
                });
                setTimeout(get_node_info,3000);
            },
            fail: function (status) {
                // 此处放Avoid Translation Prompt.失败后执行的代码
            },
        })
    }
</script>
</html>

				
