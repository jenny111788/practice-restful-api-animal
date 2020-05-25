<?php

namespace App\Http\Controllers;

use App\Type;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class TypeController extends Controller
{
    //設定操作資源需驗證的方法
    public function __construct()
    {
        //除了 index (查詢清單) 、 show (查詢單一資源) 不需要驗證其他必需認證才可以操作
        $this->middleware('auth:api', ['expect' => ['index', 'show']]);
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //查詢系統目前的動物分類列表
        $types = Type::get();
        return response($types, Response::HTTP_OK);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //驗證資料格式
        $this->validate($request, [
            'name' => 'required|max:50|unique:types,name',
            'sort' => 'nullable|integer',
        ]);

        if (empty($request->sort)) {
            $max = Type::get()->max('sort');
            $request['sort'] = $max + 1;
        }

        //Type Model 有 create 寫好的方法，把請求的內容，用all方法轉為陣列，傳入 create 方法中
        $type = Type::create($request->all());

        // 回傳 type 產生出來的實體物件資料，第二個參數設定狀態碼，可以直接寫 201 表示創建成功的狀態螞或用下面 Response 功能
        return response($type, Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Type  $type
     * @return \Illuminate\Http\Response
     */
    public function show(Type $type)
    {
        //查詢動物分類 單一 ID 的資料
        return response($type, Response::HTTP_OK);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Type  $type
     * @return \Illuminate\Http\Response
     */
    public function edit(Type $type)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Type  $type
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Type $type)
    {
        //驗證資料格式
        $this->validate($request, [
            'name' => 'required|max:50|unique:types,name',
            'sort' => 'nullable|integer',
        ]);
        
        //type Model 有 update 寫好的方法，把請求的內容，用all方法轉為陣列，傳入 update 方法中
        $type->update($request->all());

        // 回傳 type 產生出來的實體物件資料，第二個參數設定狀態碼，可以直接寫 200 表示更新成功的狀態螞或用下面 Response 功能
        return response($type, Response::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Type  $type
     * @return \Illuminate\Http\Response
     */
    public function destroy(Type $type)
    {
        // 把這個實體物件刪除
        $type->delete();

        // 回傳 null 並且給予 204 狀態碼
        return response(null, Response::HTTP_NO_CONTENT);
    }
}
