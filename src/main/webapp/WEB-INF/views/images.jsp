<div class="section">
    <div class="container centered">
        <h1>Images</h1>
        <p>
            Structurizr supports the ability to embed diagrams via a static PNG file via a regular image tag in HTML, Markdown, AsciiDoc, etc.
            <br />
            See <a href="https://structurizr.com/help/embed-image" target="_blank">Image embed</a> for more details.
        </p>
        <p class="smaller">
            (<a href="/workspace/${workspaceId}">back to workspace summary</a>)
        </p>

        <br />

        <c:choose>
        <c:when test="${not empty images}">
        <div class="centered">
        <c:forEach var="image" items="${images}">
            <div style="display: inline-block; margin: 10px 10px 40px 10px; max-width: 200px;">
                <a href="${image.url}" target="_blank"><img src="${image.url}" class="thumbnail" width="200px" onerror="this.onerror = null; this.src='/static/img/thumbnail-not-available.png';" /></a>
                <p class="smaller">
                    <b>${image.name}</b>
                    <br />
                    <fmt:formatDate value="${image.lastModifiedDate}" pattern="EEE dd MMM yyyy HH:mm z" timeZone="${user.timeZone}" />
                    <br />
                    ${image.sizeInKB} KB
                </p>
            </div>
        </c:forEach>
        </div>

        <c:if test="${workspace.editable}">
        <div class="centered">
            <form class="form-inline small centered" style="display: inline-block; margin-bottom: 5px" action="/workspace/${workspace.id}/images/delete" method="post" onsubmit="return confirm('Are you sure you want to delete the published images?');">
                <button class="btn btn-default" type="submit" name="action" value="delete" title="Delete published images"><img src="${structurizrConfiguration.cdnUrl}/bootstrap-icons/trash3.svg" class="icon-btn" /> Delete published images</button>
            </form>
        </div>
        </c:if>

        </c:when>
            <c:otherwise>
        <p class="centered smaller" style="margin-top: 40px">
            No images have been published for this workspace.
        </p>
            </c:otherwise>
        </c:choose>
    </div>
</div>