<#if title.getSiblings()?has_content>

	<#assign dateFormat = "yyyy-MM-dd" />
	<#assign carouselId = randomNamespace + "carousel" />
	<#assign pauseEvent = "hover" />
	<#assign repeat = "true" />
	<#assign intervalTime = interval.data?number * 1000 />
	<#assign randomize = getterUtil.getBoolean(randomize.data) />
	<#assign transitionEffect = effect.data?has_content?then(effect.data, '') />
	
	<#-- STYLES REQUIRED FOR THE FADE IN EFFECT AND IMAGE WIDTH -->
	
	<style>	

		<#-- CAROUSEL CAPTION FULL -->

		<#-- Full width -->

		#${carouselId} .carousel-caption {
			bottom: 0;
			left: 0;
			padding-bottom: 60px;
			right: 0;
		}

		#${carouselId} .carousel-caption .icon {
			display: inline-block;
		}

		#${carouselId} .carousel-caption .text {
			display: inline-block;
		}
		
		<#-- IMAGE WIDTH -->
		
		<#if imageWidth.data?has_content >
			#${carouselId} .carousel-image { width: ${imageWidth.data}; }
		</#if>

		<#-- FADE EFFECT -->
		
		#${carouselId}.carousel-fade .carousel-inner .item {
			-webkit-transition-property: opacity;
			transition-property: opacity;
		}

		#${carouselId}.carousel-fade .carousel-inner .active {
		    opacity: 1;
		}

		#${carouselId}.carousel-fade .carousel-inner .active.left,
		#${carouselId}.carousel-fade .carousel-inner .active.right {
            left: 0;
            opacity: 0;
            z-index: 1;
        }

		#${carouselId}.carousel-fade .carousel-inner .next.left,
		#${carouselId}.carousel-fade .carousel-inner .prev.right {
			opacity: 1;
		}
		
		#${carouselId}.carousel-fade .carousel-inner .next,
		#${carouselId}.carousel-fade .carousel-inner .prev,
		#${carouselId}.carousel-fade .carousel-inner .active.left,
		#${carouselId}.carousel-fade .carousel-inner .active.right {
			-webkit-transform: translate3d(0, 0, 0);
			transform: translate3d(0, 0, 0);
		}
		
		#${carouselId}.carousel-fade .carousel-control {
		    z-index: 2;
		}
	</style>
		
	<#assign carouselItems = [] />
	<#assign carouselIndicators = [] />
	
	<#-- FILTER VISIBLE ITEMS -->
	
	<#list title.getSiblings() as item>
			 
		<#assign visibleFrom = item.visibleFrom.data?datetime(dateFormat) />
		<#assign visibleTo = item.visibleTo.data?datetime(dateFormat) />
		<#assign visible = (.now>visibleFrom) && (.now<visibleTo) />
	
		<#if visible>
	
    		<#assign captionBg = item.captionBackground.data />
	
	        <#assign captionIconBlock = "" />
    		<#if item.captionIcon.data?has_content>
    		    <#assign captionIconBlock = "<div class="icon"><img src=\"" + item.captionIcon.data + "\" /</div>" />
    		</#if>
    		
			<#assign title = item.data />

	        <#assign captionTextBlock = "" />
    		<#if item.captionText.data?has_content>
				<#assign captionTextBlock = "<div class=\"text\">" + item.captionText.data + "</div>" />
			</#if>
			
			<#assign file = item.image.data />
			<#assign link = item.link.data />

			<#assign carouselItems = carouselItems + ["<div class=\"item\"><a href=\"${link}\"><img class=\"carousel-image\" src=\"" + file + "\" /><div class=\"carousel-caption\" style=\"background-color: ${captionBg}\">" + captionIconBlock + captionTextBlock + "</div></a></div>"] />
			<#assign carouselIndicators = carouselIndicators + ["<li data-target=\"#" + carouselId + "\" data-slide-to=\"" + item?index + "\"></li>"] />
		</#if>
	</#list>
	
	<#-- LOOP VISIBLE ITEMS -->
	
	<#if (carouselItems?size>0) >
	
		<div class="carousel slide ${transitionEffect}" data-interval="${intervalTime?string}" data-pause="${pauseEvent}" data-ride="carousel" data-wrap="${repeat}" id="${carouselId}">

			<div class="carousel-inner">
	 
				<!-- ITEMS -->
	
				<#list carouselItems as item>
					${item}
				</#list>    	
			</div>
	 
			<#-- CONTROLS -->
			
			<a class="left carousel-control" href="#${carouselId}" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
		
			<a class="right carousel-control" href="#${carouselId}" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
			
			<#-- INDICATORS -->
			
			<ol class="carousel-indicators">
				<#list carouselIndicators as item>
					${item}
				</#list>    	
			</ol>		
		</div>
		
		<#-- SET ACTIVE ITEM -->
		
		<#assign startIndex = 1 />
		<#if randomize && (carouselItems?size>1)>
			<#assign startIndex = randomizer.nextInt(carouselItems?size) />
		</#if>		

		<script type="text/javascript">
			$('#${carouselId} .carousel-inner .item:nth-child(${startIndex})').addClass('active');			
			$('#${carouselId} .carousel-indicators li:nth-child(${startIndex})').addClass('active');			
		</script>
	</#if>
</#if>