$ ( function () {
    post ();
} )

function post () {
    zbp.plugin.on ( "comment.postsuccess" , "ReplyVisible" , function ( formData , data , textStatus , jqXhr ) {
        $.ajax ( {
            url: bloghost + "zb_system/cmd.php?act=reply_visible" ,
            type: "POST" ,
            data: {
                log_id: formData.postid ,
            } ,
            dataType: "json" ,
            success: function ( res ) {
                if ( res.code == 200 ) {
                    $ ( "#post-body-" + formData.postid ).html ( res.msg );
                    zbp.plugin.unbind ( "comment.postsuccess" , "ReplyVisible" );
                    //鐒跺悗鍐欒繘鍘伙紝鏈€鍚庡垹闄ゅ綋鍓嶈繖涓枃浠�
                } else {
                    alert ( '鑾峰彇闅愯棌鏂囩珷澶辫触锛岃鍒锋柊褰撳墠椤甸潰閲嶈瘯' );
                }
                console.log ( res );
            } ,
            error: function ( err ) {
                // alert ( '鑾峰彇闅愯棌鏂囩珷澶辫触锛岃鍒锋柊褰撳墠椤甸潰閲嶈瘯' );
            }
        } );
    } );
}
