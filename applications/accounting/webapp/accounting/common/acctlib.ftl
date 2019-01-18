<#-- SCIPIO: Common Accounting utilities and definitions library
    May be imported by other applications' templates, preferably using:
      <#import "component://accounting/webapp/accounting/common/acctlib.ftl" as acctlib>
    NOTE: For this application's own templates, please include common.ftl instead (which includes this). -->

<#function getGiftCardDisplayNumber gc payMeth={} args={}>
  <#if isObjectType("map", gc)>
    <#local gc = gc.cardNumber!/>
  </#if>
  <#if gc?has_content>
    <#return maskValueLeft(gc, args.mask!-4)>
  </#if>
</#function>

<#function getCreditCardDisplayNumber cc payMeth={} args={}>
  <#if isObjectType("map", cc)>
    <#local cc = cc.cardNumber!/>
  </#if>
  <#if cc?has_content>
    <#return maskValueLeft(cc, args.mask!-4)>
  </#if>
</#function>

<#-- Here, val can be a string or a CreditCard/GiftCard entity;
    payMeth can be a paymentMethodTypeId or a PaymentMethod entity value.
    NOTE: Always pass the entity rather than a string, if available! Give this function as much information as possible. -->
<#function getPayMethDisplayNumber val payMeth args={}>
  <#if isObjectType("map", payMeth)>
    <#local payMeth = payMeth.paymentMethodTypeId!"">
  </#if>
  <#switch payMeth>
    <#case "GIFT_CARD">
      <#return getGiftCardDisplayNumber(val, payMeth, args)>
    <#case "CREDIT_CARD">
      <#return getCreditCardDisplayNumber(val, payMeth, args)>
    <#default>
      <#--<#return maskValueLeft(val, args.mask!-4)>-->
      <#-- TODO?: May be more types to handle -->
      <#return val>
  </#switch>
</#function>

<#-- SCIPIO: Moved here from component://party/webapp/partymgr/party/profileblocks/PaymentMethods.ftl and rewritten -->
<#macro maskSensitiveNumber cardNumber paymentMethod={} defaultMask=0><#-- less logical: defaultMask=4 -->
  <#-- SCIPIO: DEV NOTE: cardNumberDisplay must remain #assign, not #local, because template files check it -->
  <#assign cardNumberDisplay = getPayMethDisplayNumber(cardNumber, paymentMethod)>
  ${escapeVal(cardNumberDisplay, 'html')}<#t/>
</#macro>
