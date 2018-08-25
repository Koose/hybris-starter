<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="galleryImages" required="true" type="java.util.List" %>

<div class="carousel gallery-carousel d-none d-md-block" data-action="slide-image-gallery">
    <c:forEach items="${galleryImages}" var="container" varStatus="varStatus">
        <a href="#" class="item"><img data-lazy="${container.thumbnail.url}" alt="${fn:escapeXml(container.thumbnail.altText)}"></a>
    </c:forEach>
</div>