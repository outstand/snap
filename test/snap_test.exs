defmodule SnapTest do
  use ExUnit.Case

  alias Snap.Test.Cluster

  test "getting server status" do
    {:ok, %{"status" => status}} = Snap.get(Cluster, "/_cluster/health")
    assert not is_nil(status)
  end

  test "getting config" do
    %{url: url} = Cluster.config()
    assert url == "http://localhost:9200"
  end

  test "getting otp_app" do
    assert :snap == Cluster.otp_app()
  end
end
