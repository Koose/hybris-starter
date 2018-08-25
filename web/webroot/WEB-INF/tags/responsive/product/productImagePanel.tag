<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="galleryImages" required="true" type="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>

<div class="image-gallery">
    <c:choose>
        <c:when test="${galleryImages == null || galleryImages.size() == 0}">
            <div class="carousel image-gallery__image" data-action="slide-product">
                <div class="item">
                    <div>
                        <spring:theme code="img.missingProductImage.responsive.product" text="/" var="imagePath"/>
                        <c:choose>
                            <c:when test="${originalContextPath ne null}">
                                <c:url value="${imagePath}" var="imageUrl" context="${originalContextPath}"/>
                            </c:when>
                            <c:otherwise>
                                <c:url value="${imagePath}" var="imageUrl" />
                            </c:otherwise>
                        </c:choose>
                        <img data-lazy="${imageUrl}"/>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>

            <div class="carousel image-gallery__image" data-action="slide-product">
                <c:forEach items="${galleryImages}" var="container" varStatus="varStatus">
                    <div class="item">
                        <div>
                            <img data-lazy="${container.product.url}"
                                 data-zoom-image="${container.superZoom.url}"
                                 alt="${fn:escapeXml(container.thumbnail.altText)}" >
                        </div>
                    </div>
                </c:forEach>
            </div>
            <product:productGalleryThumbnail galleryImages="${galleryImages}" />
        </c:otherwise>
    </c:choose>
</div>
