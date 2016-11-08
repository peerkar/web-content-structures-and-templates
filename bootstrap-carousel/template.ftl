<#if title.getSiblings()?has_content>

	<#assign dateFormat = "yyyy-MM-dd" />
	<#assign carouselId = randomNamespace + "carousel" />
	<#assign pauseEvent = "hover" />
	<#assign repeat = "true" />
	<#assign intervalTime = interval.data?number * 1000 />
	<#assign randomize = getterUtil.getBoolean(randomize.data) />
	
	<#if imageWidth.data?has_content >
		<style>
			#${carouselId} .carousel-image { width: ${imageWidth.data}; }
		</style>
	</#if>
		
	<#assign carouselItems = [] />
	<#assign carouselIndicators = [] />
	
	<#-- FILTER VISIBLE ITEMS -->
	
	<#list title.getSiblings() as item>
			 
		<#assign visibleFrom = item.children[3].data?datetime(dateFormat) />
		<#assign visibleTo = item.children[4].data?datetime(dateFormat) />
		<#assign visible = (.now>visibleFrom) && (.now<visibleTo) />
	
		<#if visible>
	
			<#assign title = item.data />
			<#assign text = item.children[0].data />
			<#assign file = item.children[1].data />
			<#assign link = item.children[2].data />

			<#assign carouselItems = carouselItems + ["<div class=\"item\"><a href=\"${link}\"><img class="carousel-image" src=\"" + file + "\" /><div class=\"carousel-caption\">" + text + "</div></a></div>"] />
			<#assign carouselIndicators = carouselIndicators + ["<li data-target=\"#" + carouselId + "\" data-slide-to=\"" + item?index + "\"></li>"] />
		</#if>
	</#list>
	
	<#-- LOOP VISIBLE ITEMS -->
	
	<#if (carouselItems?size>0) >
	
		<div class="carousel slide" data-interval="${intervalTime?string}" data-pause="${pauseEvent}" data-ride="carousel" data-wrap="${repeat}" id="${carouselId}">

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