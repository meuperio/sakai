<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai"%>
<% 
	response.setContentType("text/html; charset=UTF-8");
	response.addDateHeader("Expires", System.currentTimeMillis() - (1000L * 60L * 60L * 24L * 365L));
	response.addDateHeader("Last-Modified", System.currentTimeMillis());
	response.addHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0, post-check=0, pre-check=0");
	response.addHeader("Pragma", "no-cache");
%>

<f:view>
<sakai:view title="#{msgs.tool_title}">
	
	<h3><h:outputText value="#{msgs.ical_opaqueurl_header}"/></h3>
	<sakai:instruction_message rendered="#{!SubscribeBean.opaqueUrlExists}" 
		value="#{msgs.ical_opaqueurl_explanation}" />
	
	<sakai:instruction_message rendered="#{!SubscribeBean.myWorkspace}" 
		value="#{msgs.ical_opaqueurl_myworkspace}" />
	
	<%/* We render the URL(s) itself around about here... */%>
	<h:panelGroup rendered="#{SubscribeBean.opaqueUrlExists}">
		<sakai:instruction_message value="#{msgs.ical_opaqueurl_webcal}"/>
		<h:outputLink value="#{SubscribeBean.url.webcalForm}" target="_new_">
			<h:outputText value="#{SubscribeBean.url.webcalForm}" />
		</h:outputLink>
		<sakai:instruction_message value="#{msgs.ical_opaqueurl_http}"/>
		<h:outputLink value="#{SubscribeBean.url.httpForm}" target="_new_">
			<h:outputText value="#{SubscribeBean.url.httpForm}" />
		</h:outputLink>	
	</h:panelGroup>
	
	<h:form id="subscribeForm">
		<div class="act">
			<h:commandButton
				action="#{SubscribeBean.generate}"
				value="#{msgs.ical_opaqueurl_generate}"
				styleClass="active"
				immediate="true"
				rendered="#{!SubscribeBean.opaqueUrlExists}"
				/>
			<h:commandButton
				action="#{SubscribeBean.regenerate}"
				value="#{msgs.ical_opaqueurl_regenerate}"
				styleClass="active"
				immediate="true"
				rendered="#{SubscribeBean.opaqueUrlExists}"
				/>
			<h:commandButton
				action="#{SubscribeBean.delete}"
				value="#{msgs.ical_opaqueurl_delete}"
				immediate="true"
				rendered="#{SubscribeBean.opaqueUrlExists}"
				/>
			<h:commandButton
				action="#{SubscribeBean.cancel}"
				value="#{msgs.cancel}"/>
		</div>
	</h:form>
</sakai:view>
</f:view>
