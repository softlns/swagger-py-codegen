# -*- coding: utf-8 -*-
from flask import request, g
import datetime

from . import Resource
from .. import schemas

{%- for res in resources %}


class {{ res.class_name }}(Resource):

    {%- for method, ins in res.methods.iteritems() %}

    def {{ method.lower() }}(self{{ ins.path_params.__len__() and ', ' or '' }}{{ ins.path_params | join(', ') }}):
        {%- for loc in ins.request_locations %}
        print g.{{ loc }}
        {%- endfor %}

        return {{ ins.response }}
    {%- endfor -%}
{%- endfor %}
