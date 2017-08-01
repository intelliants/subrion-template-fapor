<div class="newsletters">
	<div class="text-center">
		{if $core.config.newsletters_block_fullname}
			<input type="text" id="newsletters-name" placeholder="{lang key='enter_fullname'}" class="form-control text">
		{/if}
		<input type="text" id="newsletters-email" placeholder="{lang key='enter_email'}" class="form-control text">
		<div class="alert alert-warning" id="newsletters-msg" style="display:none">
			<button type="button" class="close">×</button>
			<span class="msg"></span>
		</div>
		<button type="button" class="btn button btn-block" id="newsletters-subscribe"><span class="fa fa-check-square-o"></span> {lang key="subscribe"}</button>
	</div>
</div>
{ia_print_css files='_IA_URL_modules/newsletters/templates/front/css/style'}
{ia_add_js}
$(function()
{
	$('#newsletters-subscribe').click(function(){
		var fullname_input = $('#newsletters-name');
		var email_input = $('#newsletters-email');

		if (email_input.val() == '')
		{
			$('#newsletters-msg')
				.toggleClass('alert-error')
				.slideDown(100);

			$('#newsletters-msg .msg').html(_t('empty_email_input'));
		}
		else
		{
			$.ajax({
				url: intelli.config.ia_url + 'newsletters/read.json',
				data: { subscriber_email: email_input.val(), subscriber_fullname: fullname_input.val()},
				dataType: 'json',
				async: false,
				success: function (response) {
					$('#newsletters-msg')
						.toggleClass('alert-error', response.error)
						.toggleClass('alert-success', !response.error)
						.slideDown(100);

					$('#newsletters-msg .msg').html(response.message);
				}
			});
		}
	});

	$('#newsletters-msg .close').click(function(){
		$('#newsletters-msg').slideUp(100);
	});
});

{/ia_add_js}
