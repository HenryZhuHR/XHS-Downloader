from .Html import get_html
from .Image import generate_url
from .Image import get_id


def get_image_link(
        url: str,
        cookie=None,
        params=None,
        proxies=None,
        timeout=10,
        **kwargs):
    html = get_html(
        url,
        cookie=cookie,
        params=params,
        proxies=proxies,
        timeout=timeout,
        **kwargs)
    ids = get_id(html)
    return generate_url(ids)
