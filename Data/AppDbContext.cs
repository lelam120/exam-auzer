using le_ba_ha_lam.Models;
using Microsoft.EntityFrameworkCore;

namespace le_ba_ha_lam.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    public DbSet<Product> Products { get; set; }
}
