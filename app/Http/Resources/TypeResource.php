<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TypeResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //預設
        // return parent::toArray($request);

        //產生 Resource資料
        return [
            'id' => $this->id,
            'name' => $this->name,
            'sort' => $this->sort,
        ];
    }
}
